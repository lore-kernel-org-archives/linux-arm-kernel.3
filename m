Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B4BEF30928
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 10:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lkS4n6+ZdvPRjbWufqh2//AU1wZNE/9YAUYKtAtaEKM=; b=BPSNmrTEcvscu422Hv30ENtX64
	ybx/gYUEBT19pTvXiqubHP+2ZGwrTqtW0NAcvKrJXNUQb7WNxOlHSpNXGfYr5pflSiH/TfEHLLptE
	YY6K8MLj4dheJCiGPN6sW/M6BQvpPKO1U9Le8+LFINlTYw7vcViO0bYJWXwuhAGA783Mqm3UszR4n
	cgl2LWLqC2n+rBn0phJpEdBv+S+863S7JNrRZS1t7Nin8ppwvV7xbKrOt3pnSL9bT9qGUzEUMjhJh
	qHGAT9PM2tvCX+hMn5OojD4+06WVg38BK17Z/wknfgCNkbYI9Hk0VtZ7gKCHOZV1KsOLfHVRlyWft
	t8+/r+wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5ah-00000001WBq-01Y3;
	Thu, 05 Mar 2026 10:05:59 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5ae-00000001W8l-0xda
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 10:05:57 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-b904e1cd038so1054352366b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 02:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772705154; x=1773309954; darn=lists.infradead.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lkS4n6+ZdvPRjbWufqh2//AU1wZNE/9YAUYKtAtaEKM=;
        b=W/t824bCQPnzDYRnM6t8Adc/BbImbqrg1KJuVRVAJ/qrTOtnxu6Prx0JG3pU8R9cst
         LdQnpOtdSWx/MG+jhF1BHMA5dStkNdBE2VGu+t6FoSI0mGe9/HnkCIXUyfwecoKm+7+M
         kkMMTtxTtvCCzNOx0jn3w+p4W9osUyrJi6Oa9wjAEINFY+DdLzAq1mmbZ3cuOE500+KD
         1YsZHBAfszBSWJpdGmD1vC8M7D9fwI13KxiResaXhau2/7IvBKGnPXwim7rlYPCSZzeC
         AT7a/aBY7qDAduMqiebWeTsMN2Of/4DR/4vUL+kQtiQIkVFWHYjc3I6oJXL7ou2CAwLz
         3yWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772705154; x=1773309954;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lkS4n6+ZdvPRjbWufqh2//AU1wZNE/9YAUYKtAtaEKM=;
        b=shL+nXwytEVqUPELMBPGzQ/1uWJttl7QKgG+hzzGU1Nh1DP4sWt3MKxllZjw0qZDC6
         5Khb2NVhItq8uMG+3O64yAQ4PKomOY5eifLO2orSmZkw/PxbSkDFyuHUyzGSKp4hpjWu
         yLPpxwuaFJhz5woP8Z1j1DOWvWMvvkBKZ1hBOHl16aiaweUPAJPx5Aa38uG6plC4T4mr
         VO5jd4H6aCZgKf06KRrb0wIjUE4mQc6QXq608l+zJMpuvtXtRUnJOzL91LhkW4/o5T7g
         LtkqcSjXLEaW0cKYUQ2AwLq3aJeeqEyouOmVC4LBwVBhn3d/4rK58ZPYhNrAHDileaKQ
         BX5w==
X-Forwarded-Encrypted: i=1; AJvYcCXJdvvB7cclKXkyCga97Oj+G6gCOuA6n8YuLqQ6xbpTBis81RHk0+2r2VXVJQs7CxKr8Yh+HRFOPiU4idgqpB5D@lists.infradead.org
X-Gm-Message-State: AOJu0YzDAsO78xezypG4Z1uFp+WSI/97ESjYGFMIX79q7/VBLwBWH9dS
	1D9dzsBvQ7UQurJS2bTJMQm+W56Ri7GWBDuubVCZNw6gdbBWEbSUH4nqSAQE2YL84xc=
X-Gm-Gg: ATEYQzw6/BBJ9Nib35XeUe4scOlDX+TzjTpNXU24jKzndE8gwbZa6U9GK6To0qENHsC
	LakE7LAJg9vsqs23z7XwVpHFkpA/12DvOJgVoaV6Eu8Lc4vwUk1AAobpIsl7q+XxR1rkh3x6azB
	jA1WTQm82ZCYbc60D8MxomyeGxpwlDFnE3XRnxRdljQpTAQ444nwfnK8rr7Kfa4u7OAJOj3zlli
	RsKcuJKx+9wq5uzC2yCx2LIlOzdo1vyj7SPHVxOsDMAoTk4C4ccbSY5itURB39OPHb2rf+ZgBls
	XwParlF29KGRbXSkWNNvs/JNRRyGKsjU5frE1D1+Tn4fIS/7YEGUuUMNabFM7AvahR3q54OKpqX
	xker3faRHVcpRxTR2ac6LkAbMSKlfvkr57PH/kzQdTMnCJgdbdXSeyj2IMJtVwAj3rDVCf2b+fm
	XMsScajvDn6+SCiA1a2t5v982n7dfCC0oBG95sw1x12Cq7xjreMl6X4FZ8B2AviFyI1XCZLCBuh
	XCUFni/RHZNgdCc6nsICUHghF7qs5LK+nGoqjV5cIVj9vs0cdy80JtkLw8hBo+8
X-Received: by 2002:a17:907:94c8:b0:b89:fb0b:65e3 with SMTP id a640c23a62f3a-b93f1411bbbmr330622466b.47.1772705152161;
        Thu, 05 Mar 2026 02:05:52 -0800 (PST)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112? (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de. [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b94037fca0dsm98139666b.50.2026.03.05.02.05.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 02:05:51 -0800 (PST)
Message-ID: <4d7c396a-6a48-4e56-b8d1-3ac7bd5d10fb@suse.com>
Date: Thu, 5 Mar 2026 11:05:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 2/4] mm/pgtable: Make pfn_pte() filter out huge
 page attributes
To: Yin Tirui <yintirui@huawei.com>, Matthew Wilcox <willy@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, david@kernel.org,
 catalin.marinas@arm.com, will@kernel.org, tglx@kernel.org, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, luto@kernel.org,
 peterz@infradead.org, akpm@linux-foundation.org, lorenzo.stoakes@oracle.com,
 ziy@nvidia.com, baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com,
 npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
 baohua@kernel.org, lance.yang@linux.dev, vbabka@suse.cz, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, anshuman.khandual@arm.com,
 rmclure@linux.ibm.com, kevin.brodsky@arm.com, apopple@nvidia.com,
 ajd@linux.ibm.com, pasha.tatashin@soleen.com, bhe@redhat.com,
 thuth@redhat.com, coxu@redhat.com, dan.j.williams@intel.com,
 yu-cheng.yu@intel.com, baolu.lu@linux.intel.com, conor.dooley@microchip.com,
 Jonathan.Cameron@huawei.com, riel@surriel.com,
 Kefeng Wang <wangkefeng.wang@huawei.com>, chenjun102@huawei.com
References: <20260228070906.1418911-1-yintirui@huawei.com>
 <20260228070906.1418911-3-yintirui@huawei.com>
 <5eaf3846-01db-471e-9903-b0b239d7838d@suse.com>
 <e8d5ba16-3071-4b4a-b6a1-d492cc46e8c2@huawei.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Autocrypt: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==
In-Reply-To: <e8d5ba16-3071-4b4a-b6a1-d492cc46e8c2@huawei.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------IBH0hIChx0pJo3JB9HTgBbXv"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_020556_424442_E526BFBF 
X-CRM114-Status: GOOD (  25.46  )
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------IBH0hIChx0pJo3JB9HTgBbXv
Content-Type: multipart/mixed; boundary="------------5UCV7MO0yGV9I2Gcqe3OKiXQ";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Yin Tirui <yintirui@huawei.com>, Matthew Wilcox <willy@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, david@kernel.org,
 catalin.marinas@arm.com, will@kernel.org, tglx@kernel.org, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, luto@kernel.org,
 peterz@infradead.org, akpm@linux-foundation.org, lorenzo.stoakes@oracle.com,
 ziy@nvidia.com, baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com,
 npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
 baohua@kernel.org, lance.yang@linux.dev, vbabka@suse.cz, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, anshuman.khandual@arm.com,
 rmclure@linux.ibm.com, kevin.brodsky@arm.com, apopple@nvidia.com,
 ajd@linux.ibm.com, pasha.tatashin@soleen.com, bhe@redhat.com,
 thuth@redhat.com, coxu@redhat.com, dan.j.williams@intel.com,
 yu-cheng.yu@intel.com, baolu.lu@linux.intel.com, conor.dooley@microchip.com,
 Jonathan.Cameron@huawei.com, riel@surriel.com,
 Kefeng Wang <wangkefeng.wang@huawei.com>, chenjun102@huawei.com
Message-ID: <4d7c396a-6a48-4e56-b8d1-3ac7bd5d10fb@suse.com>
Subject: Re: [PATCH RFC v3 2/4] mm/pgtable: Make pfn_pte() filter out huge
 page attributes
References: <20260228070906.1418911-1-yintirui@huawei.com>
 <20260228070906.1418911-3-yintirui@huawei.com>
 <5eaf3846-01db-471e-9903-b0b239d7838d@suse.com>
 <e8d5ba16-3071-4b4a-b6a1-d492cc46e8c2@huawei.com>
In-Reply-To: <e8d5ba16-3071-4b4a-b6a1-d492cc46e8c2@huawei.com>

--------------5UCV7MO0yGV9I2Gcqe3OKiXQ
Content-Type: multipart/mixed; boundary="------------0j5uJBxdVyNObR0ABqhDrgLS"

--------------0j5uJBxdVyNObR0ABqhDrgLS
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDUuMDMuMjYgMTA6MzgsIFlpbiBUaXJ1aSB3cm90ZToNCj4gDQo+IE9uIDMvNC8yMDI2
IDM6NTIgUE0sIErDvHJnZW4gR3Jvw58gd3JvdGU6DQo+PiBPbiAyOC4wMi4yNiAwODowOSwg
WWluIFRpcnVpIHdyb3RlOg0KPj4+IEEgZnVuZGFtZW50YWwgcHJpbmNpcGxlIG9mIHBhZ2Ug
dGFibGUgdHlwZSBzYWZldHkgaXMgdGhhdCBgcHRlX3RgIHJlcHJlc2VudHMNCj4+PiB0aGUg
bG93ZXN0IGxldmVsIHBhZ2UgdGFibGUgZW50cnkgYW5kIHNob3VsZCBuZXZlciBjYXJyeSBo
dWdlIHBhZ2UgYXR0cmlidXRlcy4NCj4+Pg0KPj4+IEN1cnJlbnRseSwgcGFzc2luZyBhIHBn
cHJvdCB3aXRoIGh1Z2UgcGFnZSBiaXRzIChlLmcuLCBleHRyYWN0ZWQgdmlhDQo+Pj4gcG1k
X3BncHJvdCgpKSBpbnRvIHBmbl9wdGUoKSBjcmVhdGVzIGEgbWFsZm9ybWVkIFBURSB0aGF0
IHJldGFpbnMgdGhlIGh1Z2UNCj4+PiBhdHRyaWJ1dGUsIGxlYWRpbmcgdG8gdGhlIG5lY2Vz
c2l0eSBvZiB0aGUgdWdseSBgcHRlX2Nscmh1Z2UoKWAgYW50aS0gcGF0dGVybi4NCj4+Pg0K
Pj4+IEVuZm9yY2UgdHlwZSBzYWZldHkgYnkgbWFraW5nIGBwZm5fcHRlKClgIGluaGVyZW50
bHkgZmlsdGVyIG91dCBodWdlIHBhZ2UNCj4+PiBhdHRyaWJ1dGVzOg0KPj4+IC0gT24geDg2
OiBTdHJpcCB0aGUgYF9QQUdFX1BTRWAgYml0Lg0KPj4+IC0gT24gQVJNNjQ6IE1hc2sgb3V0
IHRoZSBibG9jayBkZXNjcmlwdG9yIGJpdHMgaW4gYFBURV9UWVBFX01BU0tgIGFuZA0KPj4+
IMKgwqAgZW5mb3JjZSB0aGUgYFBURV9UWVBFX1BBR0VgIGZvcm1hdC4NCj4+PiAtIE9uIFJJ
U0MtVjogTm8gY2hhbmdlcyByZXF1aXJlZCwgYXMgUklTQy1WIGxlYWYgUE1EcyBhbmQgUFRF
cyBzaGFyZSB0aGUNCj4+PiDCoMKgIGV4YWN0IHNhbWUgaGFyZHdhcmUgZm9ybWF0IGFuZCBk
byBub3QgdXNlIGEgZGlzdGluY3QgaHVnZSBiaXQuDQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5
OiBZaW4gVGlydWkgPHlpbnRpcnVpQGh1YXdlaS5jb20+DQo+Pj4gLS0tDQo+Pj4gwqAgYXJj
aC9hcm02NC9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggfCA0ICsrKy0NCj4+PiDCoCBhcmNoL3g4
Ni9pbmNsdWRlL2FzbS9wZ3RhYmxlLmjCoMKgIHwgNCArKysrDQo+Pj4gwqAgMiBmaWxlcyBj
aGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4+Pg0KPj4+IGRpZmYg
LS1naXQgYS9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL3BndGFibGUuaCBiL2FyY2gvYXJtNjQv
aW5jbHVkZS8gYXNtLyANCj4+PiBwZ3RhYmxlLmgNCj4+PiBpbmRleCBiM2U1ODczNWM0OWIu
LmYyYTdhNDAxMDZkMiAxMDA2NDQNCj4+PiAtLS0gYS9hcmNoL2FybTY0L2luY2x1ZGUvYXNt
L3BndGFibGUuaA0KPj4+ICsrKyBiL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vcGd0YWJsZS5o
DQo+Pj4gQEAgLTE0MSw3ICsxNDEsOSBAQCBzdGF0aWMgaW5saW5lIHB0ZXZhbF90IF9fcGh5
c190b19wdGVfdmFsKHBoeXNfYWRkcl90IHBoeXMpDQo+Pj4gwqAgI2RlZmluZSBwdGVfcGZu
KHB0ZSnCoMKgwqDCoMKgwqDCoCAoX19wdGVfdG9fcGh5cyhwdGUpID4+IFBBR0VfU0hJRlQp
DQo+Pj4gwqAgI2RlZmluZSBwZm5fcHRlKHBmbixwcm90KcKgwqDCoCBcDQo+Pj4gLcKgwqDC
oCBfX3B0ZShfX3BoeXNfdG9fcHRlX3ZhbCgocGh5c19hZGRyX3QpKHBmbikgPDwgUEFHRV9T
SElGVCkgfCANCj4+PiBwZ3Byb3RfdmFsKHByb3QpKQ0KPj4+ICvCoMKgwqAgX19wdGUoX19w
aHlzX3RvX3B0ZV92YWwoKHBoeXNfYWRkcl90KShwZm4pIDw8IFBBR0VfU0hJRlQpIHwgXA0K
Pj4+ICvCoMKgwqDCoMKgwqDCoCAoKHBncHJvdF92YWwocHJvdCkgJiB+KFBURV9UWVBFX01B
U0sgJiB+UFRFX1ZBTElEKSkgfCBcDQo+Pj4gK8KgwqDCoMKgwqDCoMKgIChQVEVfVFlQRV9Q
QUdFICYgflBURV9WQUxJRCkpKQ0KPj4+IMKgICNkZWZpbmUgcHRlX25vbmUocHRlKcKgwqDC
oMKgwqDCoMKgICghcHRlX3ZhbChwdGUpKQ0KPj4+IMKgICNkZWZpbmUgcHRlX3BhZ2UocHRl
KcKgwqDCoMKgwqDCoMKgIChwZm5fdG9fcGFnZShwdGVfcGZuKHB0ZSkpKQ0KPj4+IGRpZmYg
LS1naXQgYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggYi9hcmNoL3g4Ni9pbmNs
dWRlL2FzbS8gcGd0YWJsZS5oDQo+Pj4gaW5kZXggMTY2MmM1YThmNDQ1Li5hNGRiZDgxZDQy
YmYgMTAwNjQ0DQo+Pj4gLS0tIGEvYXJjaC94ODYvaW5jbHVkZS9hc20vcGd0YWJsZS5oDQo+
Pj4gKysrIGIvYXJjaC94ODYvaW5jbHVkZS9hc20vcGd0YWJsZS5oDQo+Pj4gQEAgLTczOCw2
ICs3MzgsMTAgQEAgc3RhdGljIGlubGluZSBwZ3Byb3R2YWxfdCBjaGVja19wZ3Byb3QocGdw
cm90X3QgcGdwcm90KQ0KPj4+IMKgIHN0YXRpYyBpbmxpbmUgcHRlX3QgcGZuX3B0ZSh1bnNp
Z25lZCBsb25nIHBhZ2VfbnIsIHBncHJvdF90IHBncHJvdCkNCj4+PiDCoCB7DQo+Pj4gwqDC
oMKgwqDCoCBwaHlzX2FkZHJfdCBwZm4gPSAocGh5c19hZGRyX3QpcGFnZV9uciA8PCBQQUdF
X1NISUZUOw0KPj4+ICsNCj4+PiArwqDCoMKgIC8qIEZpbHRlciBvdXQgX1BBR0VfUFNFIHRv
IGVuc3VyZSBQVEVzIG5ldmVyIGNhcnJ5IHRoZSBodWdlIHBhZ2UgYml0ICovDQo+Pj4gK8Kg
wqDCoCBwZ3Byb3QgPSBfX3BncHJvdChwZ3Byb3RfdmFsKHBncHJvdCkgJiB+X1BBR0VfUFNF
KTsNCj4+DQo+PiBJcyBpdCByZWFsbHkgYSBnb29kIGlkZWEgdG8gc2lsZW50bHkgZHJvcCB0
aGUgYml0Pw0KPj4NCj4+IFRvZGF5IGl0IGNhbiBlaXRoZXIgYmUgdXNlZCBmb3IgYSBsYXJn
ZSBwYWdlICh3aGljaCBzaG91bGQgYmUgYSBwbWQsDQo+PiBvZiBjb3Vyc2UpLCBvciAtIG11
Y2ggd29yc2UgLSB5b3UnZCBzdHJpcCB0aGUgX1BBR0VfUEFUIGJpdCwgd2hpY2ggaXMNCj4+
IGF0IHRoZSBzYW1lIHBvc2l0aW9uIGluIFBURXMuDQo+Pg0KPj4gU28gYmFzaWNhbGx5IHlv
dSBhcmUgcmVtb3ZpbmcgdGhlIGFiaWxpdHkgdG8gdXNlIHNvbWUgY2FjaGUgbW9kZXMuDQo+
Pg0KPj4gTkFDSyENCj4+DQo+Pg0KPj4gSnVlcmdlbg0KPiANCj4gSGkgV2lsbHkgYW5kIErD
vHJnZW4sDQo+IA0KPiBGb2xsb3dpbmcgdXAgb24gdGhlIHg4NiBfUEFHRV9QU0UgYW5kIF9Q
QUdFX1BBVCBhbGlhc2luZyBpc3N1ZS4NCj4gDQo+IFRvIGFjaGlldmUgdGhlIGdvYWwgb2Yg
a2VlcGluZyBwZm5fcHRlKCkgcHVyZSBhbmQgY29tcGxldGVseSBlcmFkaWNhdGluZyB0aGUg
DQo+IHB0ZV9jbHJodWdlKCkgYW50aS1wYXR0ZXJuLCB3ZSBuZWVkIGEgd2F5IHRvIGVuc3Vy
ZSBwZm5fcHRlKCkgbmV2ZXIgcmVjZWl2ZXMgYSANCj4gcGdwcm90IHdpdGggdGhlIGh1Z2Ug
Yml0IHNldC4NCj4gDQo+IEBKw7xyZ2VuOg0KPiBKdXN0IHRvIGJlIGFic29sdXRlbHkgY2Vy
dGFpbjogaXMgdGhlcmUgYW55IHNhZmUgd2F5IHRvIGZpbHRlciBvdXQgdGhlIGh1Z2UgcGFn
ZSANCj4gYXR0cmlidXRlcyBkaXJlY3RseSBpbnNpZGUgeDg2J3MgcGZuX3B0ZSgpIHdpdGhv
dXQgYnJlYWtpbmcgUEFUPyBPciBkb2VzIHRoZSANCj4gaGFyZHdhcmUgYml0LWFsaWFzaW5n
IG1ha2UgdGhpcyBzdHJpY3RseSBpbXBvc3NpYmxlIGF0IHRoZSBwZm5fcHRlKCkgbGV2ZWw/
DQoNClRoZXJlIGlzIG5vIGh1Z2UgYml0IGF0IHRoZSBQVEUgbGV2ZWwuIEl0IGlzIGV4aXN0
aW5nIG9ubHkgYXQgdGhlIFBNRCBhbmQgdGhlDQpQVUQgbGV2ZWwuDQoNClNvOiB5ZXMsIGl0
IGlzIGFic29sdXRlbHkgaW1wb3NzaWJsZSB0byBmaWx0ZXIgaXQgb3V0LCBhcyB0aGUgYml0
IGhhcyBhDQpkaWZmZXJlbnQgbWVhbmluZyBpbiAicmVhbCIgUFRFcyAod2l0aCAiUFRFIiBo
YXZpbmcgdGhlIG1lYW5pbmc6IGEgdHJhbnNsYXRpb24NCmVudHJ5IGluIGEgcGFnZSByZWZl
cmVuY2VkIGJ5IGEgUE1EIGVudHJ5IG5vdCBoYXZpbmcgdGhlIFBTRSBiaXQgc2V0KS4NCg0K
PiANCj4gQFdpbGx5IEBKw7xyZ2VuOg0KPiBBc3N1bWluZyBpdCBpcyBpbXBvc3NpYmxlIHRv
IGZpbHRlciB0aGlzIHNhZmVseSBpbnNpZGUgcGZuX3B0ZSgpIG9uIHg4Niwgd2UgbXVzdCAN
Cj4gdHJhbnNsYXRlIHRoZSBwZ3Byb3QgYmVmb3JlIHBhc3NpbmcgaXQgZG93bi4gVG8gbWFp
bnRhaW4gc3RyaWN0IHR5cGUtc2FmZXR5IGFuZCANCj4gc3RpbGwgZHJvcCBwdGVfY2xyaHVn
ZSgpLCBJIHBsYW4gdG8gaW50cm9kdWNlIHR3byBhcmNoLW5ldXRyYWwgd3JhcHBlcnM6DQo+
IA0KPiB4ODY6DQo+IC8qIFRyYW5zbGF0ZXMgbGFyZ2UgcHJvdCB0byA0Sy4gU2hpZnRzIFBB
VCBiYWNrIHRvIGJpdCA3LCBpbmhlcmVudGx5IGNsZWFyaW5nIA0KPiBfUEFHRV9QU0UgKi8N
Cj4gI2RlZmluZSBwZ3Byb3RfaHVnZV90b19wdGUocHJvdCnCoMKgwqAgcGdwcm90X2xhcmdl
XzJfNGsocHJvdCkNCj4gLyogVHJhbnNsYXRlcyA0SyBwcm90IHRvIGxhcmdlLiBTaGlmdHMg
UEFUIHRvIGJpdCAxMiwgc3RyaWN0bHkgc2V0cyBfUEFHRV9QU0UgKi8NCj4gI2RlZmluZSBw
Z3Byb3RfcHRlX3RvX2h1Z2UocHJvdCkgX19wZ3Byb3QocGdwcm90X3ZhbChwZ3Byb3RfNGtf
Ml9sYXJnZShwcm90KSkgfCANCj4gX1BBR0VfUFNFKQ0KDQpTZWVtcyB0byBiZSBva2F5Lg0K
DQoNCkp1ZXJnZW4NCg==
--------------0j5uJBxdVyNObR0ABqhDrgLS
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------0j5uJBxdVyNObR0ABqhDrgLS--

--------------5UCV7MO0yGV9I2Gcqe3OKiXQ--

--------------IBH0hIChx0pJo3JB9HTgBbXv
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmmpVX4FAwAAAAAACgkQsN6d1ii/Ey/Q
fwf+PMUoSzrh4GgZ4p2g9HKWv2hwH2+K/bdStVYbu5X1vagRbtZliX1FWpF1oKjaKbL5DDJNIyxB
zkiCpGavvH+YBm/3WlS3sCa0XWIL5PNx58y3xrE8VMMy+JR+ep/Y+5wwkmu8xnJq6Ve8x5CPyLCk
9l7KM9lxs+GeZRb2Myy0ZQx2QYJbPmIyNaFjcq8455Nqd5hFUdYz192Og6f6hYZ0VB9lPfFyVocJ
64CizN+y/P3P1ka03VixrZ3kh+abP98r5uDJ3yXtfPi4h7GDIktQR9iCDbF7nWohmxGP8sV2BvGp
BilPW6WrtO/Ok1Nhusie4FX4RYYXFwjKmhsHHJH9GA==
=EuOw
-----END PGP SIGNATURE-----

--------------IBH0hIChx0pJo3JB9HTgBbXv--

