Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69568C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 16:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NLHQu01znICve73PRKiUqGXlEoXbgUBhtxBnnuUPUyM=; b=2UCO4TXi7y4L1vv43rst3UfQvO
	F/IA8AGvLZXcu4xwNmr8/ZI6bfFwnIHzdx6Qz6uF8FordlkUOIzZHOcQOA9WuVmchDijuouyX9zrp
	VgxuqKzStTfP/lat7eKaSljjWWtW9k2T/Be443UN6aLu8mGZxl8ZMveRDS/U5KX4JPdnzaxpz1E9d
	+o9cLEZ0Sj0rDCkdKqSFKU/m3Q35KrEqx0QM86iAoC3Q9TAOMTaYGcI/epw+4QGoyaXJdBVZN4nfC
	IJcbd6iT60d8uYIgjD8E811Zd7mDSXSvr5B7LLW5KkbETl0t3Slz4OT1cAzILK5Su7TbVPyTOfkmR
	D2/L2ywg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHPiY-0000000DW9W-0vYT;
	Tue, 20 May 2025 16:21:26 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHPPg-0000000DRFG-3NwN;
	Tue, 20 May 2025 16:01:57 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-6020ff8d51dso1450597a12.2;
        Tue, 20 May 2025 09:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747756915; x=1748361715; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NLHQu01znICve73PRKiUqGXlEoXbgUBhtxBnnuUPUyM=;
        b=gVUWV0XSp/DfJVjgQQXGquu5mj7voR7VrhHy/3r/zDTqKbHVXOrXtwWr956C1VWUSI
         5SIL7IjwZ7HLDUxbfZoqFcjByr5ZZAs7muJROsskCpmnfnctG5o4vf1wTSRzL+9oWC+6
         GsFRQsSwFr1KDo0dIZjI560npzdC7SEAqiGm+3cgqRsh+X6fP9z+BVQz8Lqfs0Awoedb
         /Y/JktyDvXxywyONygv8w4KQA20FXaZdy4bzTFE8XQlHXPrvRMSMevXIDwz5JP0SCt5G
         xJyFBjS7OC6RAD8NK2ri8aJ1pMd3ZXmGoYBuLKVrfZBMyW3CsBfU4x+n2R1Kxyz5e2Vv
         chPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747756915; x=1748361715;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NLHQu01znICve73PRKiUqGXlEoXbgUBhtxBnnuUPUyM=;
        b=AK0SBgRZ8J8V0s3cposnMyEV2uzj7BP2WsAA+CBiNaxvEnXWxxx1tmEMXCXnnwT9tX
         d2vbLEIq/3J/TlaQuvtNCwI5v8Wjem9Luo9j3IGCVv5wetdMnR8Q17fShxWhGzRWT2PG
         supR8wvekoV28ywGPPuO8/3U0JTfUAjesJk0uTMIJ2SfW8H3wDgcShJ6eo2JVjlwX2uZ
         GlTbLTJhS9afY8LxDTorHDwBQNuAfaBPUee38n/v3CssaGTDqcuTThhhp9VCp8yr/Aqa
         oIx2QSgHptGk/aqfzZGyIuPCDkDkp05HkO/pHX/IuL3XYRk56+UaSPC7CBWMICGRjXGl
         8/Ug==
X-Forwarded-Encrypted: i=1; AJvYcCVUPJ6rVa6mqh1QOg1F2YUm10KpM6A6sz82iZh+v6TYnGI+0XobmMF+nc9FVMH7KzNuzH0ysKOs1q1k9Oc3P8M=@lists.infradead.org, AJvYcCWl95DIc7BUj5IumSwh1Nk6AmcmXqIERKNhFJTVGO9IvwWGDIOAkgZlzrDy/ffOd6fkSvnhvGzV8PZmhX0R8r5Y@lists.infradead.org
X-Gm-Message-State: AOJu0YzeBqzt48Oqf/v6z2hfkegBWrXDKFiiNMNhJbsjBRZsBBIRT0RG
	zRaYmVyR5VNH+SmxN9wOIT9chKct4bE0RXziHGGXLiVKthWkRULnaYCj5vGPOQyeuOQ=
X-Gm-Gg: ASbGncsBjJnPoZdRjt6kfmhnJ6RgAeAFh/Mx0XpNlNuXNJ8Zy5R/rkgANXLcTun5X0L
	T+igR6RNnOmMz/CjsPex1pNrYBFcgCVzxOikBL7oG8WNbgGZNSvsL19atyMXG60EK32VKNbRF98
	MDdPCDdpBPGeKkxwD4m9bCXmHOnWMtCP+CdAQGlGnsywXbYZ5jN4BSlh9snq6f37hMEDI6F/ZfZ
	jp6DfkyJg2qjGLAJIQ+stlidRl4Fz1FReBRVOMfEQc78TRNoj/hXc3jUU/8A+iucPBV6ckZQOfb
	JqzAI3E3wnJkmJWGOMdfSVo9Q2tMXvDwVdQTvDuw9Fji7B/j5LQBJw==
X-Google-Smtp-Source: AGHT+IHyQCwN+N8keILzdY8urJ4nceUZZMCFLVcZ2JJ//X1ZPm39zCCDWnYiM9DBHR4AHkitjLt/Mg==
X-Received: by 2002:a17:907:db02:b0:ad5:27b6:7fd1 with SMTP id a640c23a62f3a-ad52d48da04mr1704960866b.17.1747756914001;
        Tue, 20 May 2025 09:01:54 -0700 (PDT)
Received: from [10.176.234.34] ([137.201.254.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d4ca654sm740504266b.158.2025.05.20.09.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 09:01:52 -0700 (PDT)
Message-ID: <32c36b58dcdbb09403fa9dccff28b6bee76882e0.camel@gmail.com>
Subject: Re: [PATCH v5] ufs: core: Add HID support
From: Bean Huo <huobean@gmail.com>
To: Huan Tang <tanghuan@vivo.com>, alim.akhtar@samsung.com,
 avri.altman@wdc.com,  bvanassche@acm.org,
 James.Bottomley@HansenPartnership.com,  martin.petersen@oracle.com,
 matthias.bgg@gmail.com,  angelogioacchino.delregno@collabora.com,
 peter.wang@mediatek.com,  manivannan.sadhasivam@linaro.org,
 quic_nguyenb@quicinc.com, luhongfei@vivo.com,  linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: opensource.kernel@vivo.com, Wenxing Cheng <wenxing.cheng@vivo.com>
Date: Tue, 20 May 2025 18:01:50 +0200
In-Reply-To: <20250520094054.313-1-tanghuan@vivo.com>
References: <20250520094054.313-1-tanghuan@vivo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_090156_862653_B608DDDB 
X-CRM114-Status: UNSURE (   8.68  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAyMDI1LTA1LTIwIGF0IDE3OjQwICswODAwLCBIdWFuIFRhbmcgd3JvdGU6Cj4gQEAg
LTg3LDYgKzg3LDI2IEBAIHN0YXRpYyBjb25zdCBjaGFyICp1ZnNfd2JfcmVzaXplX3N0YXR1c190
b19zdHJpbmcoZW51bSB3Yl9yZXNpemVfc3RhdHVzIHN0YXR1cykKPiDCoMKgwqDCoMKgwqDCoMKg
fQo+IMKgfQo+IMKgCj4gK3N0YXRpYyBjb25zdCBjaGFyICp1ZnNfaGlkX3N0YXRlX3RvX3N0cmlu
ZyhlbnVtIHVmc19oaWRfc3RhdGUgc3RhdGUpCj4gK3sKPiArwqDCoMKgwqDCoMKgwqBzd2l0Y2gg
KHN0YXRlKSB7Cj4gK8KgwqDCoMKgwqDCoMKgY2FzZSBISURfSURMRToKPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuICJpZGxlIjsKPiArwqDCoMKgwqDCoMKgwqBjYXNlIEFO
QUxZU0lTX0lOX1BST0dSRVNTOgo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1
cm4gImFuYWx5c2lzX2luX3Byb2dyZXNzIjsKPiArwqDCoMKgwqDCoMKgwqBjYXNlIERFRlJBR19S
RVFVSVJFRDoKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuICJkZWZyYWdf
cmVxdWlyZWQiOwo+ICvCoMKgwqDCoMKgwqDCoGNhc2UgREVGUkFHX0lOX1BST0dSRVNTOgo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gImRlZnJhZ19pbl9wcm9ncmVzcyI7
Cj4gK8KgwqDCoMKgwqDCoMKgY2FzZSBERUZSQUdfQ09NUExFVEVEOgo+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gImRlZnJhZ19jb21wbGV0ZWQiOwo+ICvCoMKgwqDCoMKg
wqDCoGNhc2UgREVGUkFHX05PVF9SRVFVSVJFRDoKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgcmV0dXJuICJkZWZyYWdfbm90X3JlcXVpcmVkIjsKPiArwqDCoMKgwqDCoMKgwqBkZWZh
dWx0Ogo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gInVua25vd24iOwo+
ICvCoMKgwqDCoMKgwqDCoH0KPiArfQoKVGhlIGVudW0gdWZzX2hpZF9zdGF0ZSB2YWx1ZXMgYXJl
IGNvbnRpZ3VvdXMgYW5kIHN0YXJ0IGZyb20gMCwgbWF5YmUgY2hhbmdlIHN3aXRjaC1zdGF0ZSB0
byA6CgojZGVmaW5lIE5VTV9VRlNfSElEX1NUQVRFUyA2CnN0YXRpYyBjb25zdCBjaGFyICp1ZnNf
aGlkX3N0YXRlc1tOVU1fVUZTX0hJRF9TVEFURVNdID0gewogICAgImlkbGUiLAogICAgImFuYWx5
c2lzX2luX3Byb2dyZXNzIiwKICAgICJkZWZyYWdfcmVxdWlyZWQiLAogICAgImRlZnJhZ19pbl9w
cm9ncmVzcyIsCiAgICAiZGVmcmFnX2NvbXBsZXRlZCIsCiAgICAiZGVmcmFnX25vdF9yZXF1aXJl
ZCIKfTsKCnN0YXRpYyBjb25zdCBjaGFyICp1ZnNfaGlkX3N0YXRlX3RvX3N0cmluZyhlbnVtIHVm
c19oaWRfc3RhdGUgc3RhdGUpIHsKICAgIGlmICgodW5zaWduZWQgaW50KXN0YXRlIDwgTlVNX1VG
U19ISURfU1RBVEVTKQogICAgICAgIHJldHVybiB1ZnNfaGlkX3N0YXRlc1tzdGF0ZV07CiAgICBy
ZXR1cm4gInVua25vd24iOwp9Cgo=


