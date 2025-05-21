Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B4EDC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 14:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mr5CtfmCp0+Fg3KbvhDtMvPgXfFBME1nsOYjr9Lr5AM=; b=mzMdIyvGJ5mJ8Hgku89Z8p7XfN
	Gz7NT5hEeXiTbCMy8iMUg2ukLeAD12aAMBbKjg77du+7B2JOOaoH9HQ+xduC10GTgqtXQaUZoQh34
	mhZz4tXsqOcamvzI3tkMid/tT6kV1Wjhz4B8iFzdUvGYIQkZKEwlRb57gt61NkxmdVEdbn6cTfcy0
	dLKOVX81lkz4pMk7W0apwj5Ur6Z7ypfs3K9Etg69G1gkOmMfjP+VkxD+7NjHvZH1aItfhydiQztiy
	L7ohifHO/SvMK/abhdnd35gjNcDlnnoQENhpTtUPCGpGLRjUpFkJQ9aUGmkq3nhkfxoKZxr1fl4ea
	pn3yy6AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHkuT-0000000GC6z-15Al;
	Wed, 21 May 2025 14:59:09 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHksI-0000000GBia-2M2U;
	Wed, 21 May 2025 14:56:55 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-601ab204085so6943240a12.1;
        Wed, 21 May 2025 07:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747839413; x=1748444213; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mr5CtfmCp0+Fg3KbvhDtMvPgXfFBME1nsOYjr9Lr5AM=;
        b=jJLvqGG/ePHlq5bbb+qsSAQsIPCz77lWS49NTB+flxvwH+JNfjUjsMmnlxOEkPLSxL
         B8LFIRflHKA6God9KcUMnxrFW/rIRLcwcrpVsm6c4p1BSI6YflFLtkW3TC2z19Vkkj7X
         rtuzIEg0YHTguz1jg4JYrn+H6P6EIlibhi9VpBgq2FN0/8jAiUNuCR5d57NoawmrMmzD
         +2nlN6+Z2vGvaKkqp+Vnaxy3wRgT34oUxjO+/anlpnuWp+49AHmNUYnz9CWJ4yC7L8Sc
         QVXgAkSJiZ3xUlESbrXCuT2akJEPOFAj56yO0H8niYCdDeMVuMyfUQ97ODCcUjz66F3k
         fEIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747839413; x=1748444213;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mr5CtfmCp0+Fg3KbvhDtMvPgXfFBME1nsOYjr9Lr5AM=;
        b=c5HPuiW/KIS2RdJRbXs8UvQTxbig82ASynvMRYh3IGxVLzW/5fP9+50uv4IBHKle+2
         a3JOCHh6ocKJdnnAuWOLg8gs/hmuv79CjK7AAFzu/AU3nkeZqWVSKLJikhLeWscoQEvT
         QZ2ZTHakseMxXC1I3nEXWYeWyWyJ8laxngL1CxIBSJQ8wiOnHkOvLpal/0eRLszCXInZ
         3pR6sKVDM7cIFpfFYmnNCfcvT3B6TxTLHRaYbEr5CzIWWDflhb9adJ/NL4mJr1Y8MU2G
         4WwMmJrpKTMaaETYTKEgSHnR5jRROlyGbMvYUSRjcK4tONS4n6AG0YjL7uMklHHbJfUf
         /cUA==
X-Forwarded-Encrypted: i=1; AJvYcCV1bkn04osFDH+xJ7O1sr97ciUwEj/BIPErH12GjOxY2a4+ekqwvyyucUKO5wXErcHcYTJ+L4aiEA11/VYayH95@lists.infradead.org, AJvYcCVw/84xylc+hDhUBqFr7FNI5IdezFSQqs1tV48w5lZSZeTirT/coE3+q4ClwiR7w2XraRED8bzXu++MNW93MZQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YwbF22ukk6SRPA0FtUoAWjpmceXcYnmDQbXpSwHjhcijytYcvAC
	ZlbFt0h2kOW6q8gGa0/4x+EFDJWooittlczrFHgddbek5rjppTKohf7z
X-Gm-Gg: ASbGnctaTCtSmXIRTOn9u7uV4u0ZPFhsUK/lKAsvxUlXK0cJ6rmUoa0tFudnNj/iUbB
	VU2x8FRbj7Rd5iMhKdBW53oOfiIcT8Hx5+hAYrW3phRT+55vz4hxGCd3SZjBo3wt5Z1MFjOwqUf
	CQpAns4GbWxpuFTYpyzosZrvEhy/iLshtga3qBETbUgNDksDFG5KwPyI+23V4pggUWRwrJGTxdp
	B6eSH2p81oL06IFO6l2gQzN1p6RMu0hdvP4M2Fvf2YWul+SS5870yf8VhvvCmFyjY//4Lzih0Zi
	bPl3jqIlSHGgAJuA0DhDaZJ6CSf1GFLuUHnTvI7Dminn6yZYJ/m4MQ==
X-Google-Smtp-Source: AGHT+IGa3r5Ooxfy9O+pD0KSbSNbuGHsQRY8f+56IAhxBCvhms08xP7u4zJuzcUr47n1DZbGzCGkvg==
X-Received: by 2002:a17:906:c113:b0:ad5:6174:f947 with SMTP id a640c23a62f3a-ad56174fbcdmr1332821766b.22.1747839412470;
        Wed, 21 May 2025 07:56:52 -0700 (PDT)
Received: from [10.176.234.34] ([137.201.254.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52cb1abc8sm903795466b.0.2025.05.21.07.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 07:56:51 -0700 (PDT)
Message-ID: <7e034db7e46a33287f59159401affd58a81abad6.camel@gmail.com>
Subject: Re: [PATCH v5] ufs: core: Add HID support
From: Bean Huo <huobean@gmail.com>
To: Huan Tang <tanghuan@vivo.com>, bvanassche@acm.org
Cc: James.Bottomley@HansenPartnership.com, alim.akhtar@samsung.com, 
 angelogioacchino.delregno@collabora.com, avri.altman@wdc.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-scsi@vger.kernel.org, 
 luhongfei@vivo.com, manivannan.sadhasivam@linaro.org,
 martin.petersen@oracle.com,  matthias.bgg@gmail.com,
 opensource.kernel@vivo.com, peter.wang@mediatek.com, 
 quic_nguyenb@quicinc.com, wenxing.cheng@vivo.com
Date: Wed, 21 May 2025 16:56:50 +0200
In-Reply-To: <20250521143224.587-1-tanghuan@vivo.com>
References: <b0ec5b8a-b303-4e5b-bca9-4524eba9fa31@acm.org>
	 <20250521143224.587-1-tanghuan@vivo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_075654_603591_BBB4C78A 
X-CRM114-Status: GOOD (  21.10  )
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

T24gV2VkLCAyMDI1LTA1LTIxIGF0IDIyOjMyICswODAwLCBIdWFuIFRhbmcgd3JvdGU6Cj4gPiA+
ID4gK3N0YXRpYyBjb25zdCBjaGFyICp1ZnNfaGlkX3N0YXRlX3RvX3N0cmluZyhlbnVtIHVmc19o
aWRfc3RhdGUgc3RhdGUpCj4gPiA+ID4gK3sKPiA+ID4gPiArwqDCoMKgwqDCoMKgIHN3aXRjaCAo
c3RhdGUpIHsKPiA+ID4gPiArwqDCoMKgwqDCoMKgIGNhc2UgSElEX0lETEU6Cj4gPiA+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuICJpZGxlIjsKPiA+ID4gPiArwqDCoMKg
wqDCoMKgIGNhc2UgQU5BTFlTSVNfSU5fUFJPR1JFU1M6Cj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgcmV0dXJuICJhbmFseXNpc19pbl9wcm9ncmVzcyI7Cj4gPiA+ID4gK8Kg
wqDCoMKgwqDCoCBjYXNlIERFRlJBR19SRVFVSVJFRDoKPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCByZXR1cm4gImRlZnJhZ19yZXF1aXJlZCI7Cj4gPiA+ID4gK8KgwqDCoMKg
wqDCoCBjYXNlIERFRlJBR19JTl9QUk9HUkVTUzoKPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCByZXR1cm4gImRlZnJhZ19pbl9wcm9ncmVzcyI7Cj4gPiA+ID4gK8KgwqDCoMKg
wqDCoCBjYXNlIERFRlJBR19DT01QTEVURUQ6Cj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgcmV0dXJuICJkZWZyYWdfY29tcGxldGVkIjsKPiA+ID4gPiArwqDCoMKgwqDCoMKg
IGNhc2UgREVGUkFHX05PVF9SRVFVSVJFRDoKPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCByZXR1cm4gImRlZnJhZ19ub3RfcmVxdWlyZWQiOwo+ID4gPiA+ICvCoMKgwqDCoMKg
wqAgZGVmYXVsdDoKPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4g
InVua25vd24iOwo+ID4gPiA+ICvCoMKgwqDCoMKgwqAgfQo+ID4gPiA+ICt9Cj4gPiA+IAo+ID4g
PiBUaGUgZW51bSB1ZnNfaGlkX3N0YXRlIHZhbHVlcyBhcmUgY29udGlndW91cyBhbmQgc3RhcnQg
ZnJvbSAwLCBtYXliZSBjaGFuZ2Ugc3dpdGNoLXN0YXRlIHRvIDoKPiA+ID4gCj4gPiA+ICNkZWZp
bmUgTlVNX1VGU19ISURfU1RBVEVTIDYKPiA+ID4gc3RhdGljIGNvbnN0IGNoYXIgKnVmc19oaWRf
c3RhdGVzW05VTV9VRlNfSElEX1NUQVRFU10gPSB7Cj4gPiA+IMKgwqDCoCAiaWRsZSIsCj4gPiA+
IMKgwqDCoMKgICJhbmFseXNpc19pbl9wcm9ncmVzcyIsCj4gPiA+IMKgwqDCoMKgICJkZWZyYWdf
cmVxdWlyZWQiLAo+ID4gPiDCoMKgwqDCoCAiZGVmcmFnX2luX3Byb2dyZXNzIiwKPiA+ID4gwqDC
oMKgwqAgImRlZnJhZ19jb21wbGV0ZWQiLAo+ID4gPiDCoMKgwqDCoCAiZGVmcmFnX25vdF9yZXF1
aXJlZCIKPiA+ID4gfTsKPiAKPiA+IElmIHRoaXMgY2hhbmdlIGlzIG1hZGUsIHBsZWFzZSB1c2Ug
dGhlIGRlc2lnbmF0ZWQgaW5pdGlhbGl6ZXIgc3ludGF4Cj4gPiAoW2xhYmVsXSA9ICJ0ZXh0Iiku
IFRoaXMgd2lsbCBtYWtlIGl0IGVhc2llciB0byB2ZXJpZnkgdGhhdCB0aGUKPiA+IGVudW1lcmF0
aW9uIGxhYmVscyBhbmQgdGhlIHN0cmluZ3MgbWF0Y2guCj4gCj4gSGkgYmFydCBhbmQgYmVhbiBz
aXIsCj4gCj4gVGhhbmsgeW91IGZvciB5b3VyIGNvbW1lbnRzIGFuZCBndWlkYW5jZe+8gQo+IAo+
IFdoYXQgZG8geW91IHRoaW5rIG9mIHRoZSBmb2xsb3dpbmcgY2hhbmdlcz8KPiAKPiB1ZnMuaAo+
IMKgKy8qIGJISURTdGF0ZSBhdHRyaWJ1dGUgdmFsdWVzICovwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgCj4gwqArZW51bSB1ZnNfaGlkX3N0YXRlIHvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAKPiDCoCvCoMKgwqDC
oMKgwqAgSElEX0lETEXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPSAwLMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIAo+IMKgK8KgwqDCoMKgwqDCoCBBTkFMWVNJU19JTl9QUk9H
UkVTU8KgwqDCoCA9IDEswqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgCj4gwqArwqDCoMKg
wqDCoMKgIERFRlJBR19SRVFVSVJFRMKgwqDCoMKgwqDCoMKgwqAgPSAyLMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIAo+IMKgK8KgwqDCoMKgwqDCoCBERUZSQUdfSU5fUFJPR1JFU1PCoMKg
wqDCoMKgID0gMyzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAKPiDCoCvCoMKgwqDCoMKg
wqAgREVGUkFHX0NPTVBMRVRFRMKgwqDCoMKgwqDCoMKgID0gNCzCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAKPiDCoCvCoMKgwqDCoMKgwqAgREVGUkFHX05PVF9SRVFVSVJFRMKgwqDCoMKg
ID0gNSzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAKPiDCoCvCoMKgwqDCoMKgwqAgTlVN
X1VGU19ISURfU1RBVEVTwqDCoMKgwqDCoCA9IDYswqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgCj4gwqArfTsgCj4gCj4gdWZzLXN5c2ZzLmMKPiDCoCtzdGF0aWMgY29uc3QgY2hhciAqIGNv
bnN0IHVmc19oaWRfc3RhdGVzW10gPSB7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAKPiDCoCvCoMKgwqDCoMKgwqAgW0hJRF9J
RExFXcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgID0gImlkbGUiLMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgCj4gwqArwqDCoMKgwqDCoMKgIFtBTkFMWVNJU19JTl9QUk9HUkVTU13CoCA9ICJhbmFseXNp
c19pbl9wcm9ncmVzcyIswqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgCj4gwqArwqDCoMKgwqDCoMKgIFtERUZSQUdfUkVRVUlSRURdwqDCoMKgwqDCoMKgID0gImRl
ZnJhZ19yZXF1aXJlZCIswqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIAo+IMKgK8KgwqDCoMKgwqDCoCBbREVGUkFHX0lOX1BST0dSRVNTXcKgwqDC
oCA9ICJkZWZyYWdfaW5fcHJvZ3Jlc3MiLMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAKPiDCoCvCoMKgwqDCoMKgwqAgW0RFRlJBR19DT01QTEVURURdwqDC
oMKgwqDCoCA9ICJkZWZyYWdfY29tcGxldGVkIizCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIAo+IMKgK8KgwqDCoMKgwqDCoCBbREVGUkFHX05PVF9S
RVFVSVJFRF3CoMKgID0gImRlZnJhZ19ub3RfcmVxdWlyZWQiLMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgCj4gwqArfTvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAKPiDCoCvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgCj4gwqArc3RhdGljIGNvbnN0IGNoYXIgKnVmc19oaWRfc3RhdGVfdG9fc3RyaW5n
KGVudW0gdWZzX2hpZF9zdGF0ZSBzdGF0ZSnCoMKgwqDCoMKgwqDCoMKgwqDCoCAKPiDCoCt7wqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAKPiDCoCvCoMKgwqDCoMKgwqAg
aWYgKHN0YXRlIDwgTlVNX1VGU19ISURfU1RBVEVTKcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIAo+
IMKgK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHVmc19oaWRfc3RhdGVzW3N0
YXRlXTvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAKPiDCoCvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgCj4gwqArwqDCoMKgwqDCoMKgIHJldHVybiAidW5rbm93biI7wqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIAo+IMKgK30gCj4gCj4gLi4u
Cj4gCj4gK3N0YXRpYyBzc2l6ZV90IHN0YXRlX3Nob3coc3RydWN0IGRldmljZSAqZGV2LAo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSAqYXR0
ciwgY2hhciAqYnVmKQo+ICt7Cj4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IHVmc19oYmEgKmhiYSA9
IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwo+ICvCoMKgwqDCoMKgwqDCoHUzMiB2YWx1ZTsKPiArwqDC
oMKgwqDCoMKgwqBpbnQgcmV0Owo+ICsKPiArwqDCoMKgwqDCoMKgwqByZXQgPSBoaWRfcXVlcnlf
YXR0cihoYmEsIFVQSVVfUVVFUllfT1BDT0RFX1JFQURfQVRUUiwKPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoFFVRVJZX0FUVFJfSUROX0hJRF9TVEFURSwg
JnZhbHVlKTsKPiArwqDCoMKgwqDCoMKgwqBpZiAocmV0KQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqByZXR1cm4gcmV0Owo+ICsKPiArwqDCoMKgwqDCoMKgwqByZXR1cm4gc3lzZnNf
ZW1pdChidWYsICIlc1xuIiwgdWZzX2hpZF9zdGF0ZV90b19zdHJpbmcodmFsdWUpKTsKPiArfQo+
IAo+IFRoYW5rcwo+IEh1YW4KPiAKPiAKPiAKCgpsb29rcyBnb29kIHRvIG1lLCB3aXRoIHRoaXMg
Y2hhbmdlLCBwbGVhc2UgYWRkIG15IHJldmlld2VkLWJ5IHRhZyBpbiB0aGUgbmV4dCB2ZXJzaW9u
LgoKS2luZCByZWdhcmRzLApCZWFuCg==


