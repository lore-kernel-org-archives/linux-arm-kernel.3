Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E1C9CD4F39
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 18:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dFuv5s64DKE2+32ruPQU8EzjMjP029i3/D35qWWpAs4=; b=I2+o14CynHIS4EYJVuCvljp+L+
	PDERlEiRNP2YFYDN7XJE7B6rqQJVVi2Wt3z9ONAYkiUhdwYJu+GFR6FCDeFYSjm5EWDFMoRMiNJ9J
	dIkbgDWkaFqaUiJZY6QglZDCQay9ZqfLxagwoilTwikiCYLQi/kMT33iB4BvhYNKbKWmoYsEbomTP
	I4jIpIHMhfNRXq5pY8SBdJ4tVOI+/SZUuNqrTd5+qkkL1OHvd8nCV/iJNI8vPXonwoqZFNmQYG52V
	LnMUUC5vmGJBZWlaAr/9pNy+x7b4c6Ku6TKx8yQvre1qnpOfayvosiLOwae8IUmZn6Bt68Fs4Q7Ra
	J0N0ztuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNbH1-00000006NJp-2NL6;
	Thu, 14 May 2026 18:59:07 +0000
Received: from mail-lf1-f45.google.com ([209.85.167.45])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNbGz-00000006NJG-1dPy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 18:59:06 +0000
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a8891febd2so10005503e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 11:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778785142; x=1779389942; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dFuv5s64DKE2+32ruPQU8EzjMjP029i3/D35qWWpAs4=;
        b=sSDerW1YoZguG1qGBNkJTgxDr4bnxb8uWuh7Cwr4ghUHOsIGj/Z2Vd4/N5X1ieBZ9y
         JH0s4H6MsJd0YV771bqkOvloBZ91UnN67FX6mb+YOAHrRFZ2i5vhsHj/DLOjjtmt4UPS
         MYPI+LC6h8F2IcuiNJvVse8dedlpzjhA9n9vecNe7FlYJsYyQhd3F6G5/zRc2XPA+5a7
         xVhSy1sy3BjBoO0vJGW3utkhdm1eOXSDWzyy/nM4q/2TISmLLBwZA626jaQv6v4LWE47
         JT909WvMycW2KtQASMFwKOk45gtibTcqdpbHKqBGIn4kEKLKJX4N/QFkTHqLGeMj4mbP
         OYxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778785142; x=1779389942;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dFuv5s64DKE2+32ruPQU8EzjMjP029i3/D35qWWpAs4=;
        b=pTUZiuGR2drmgn/H0LlHdemsx9bQJAMm19jY6NqCneYRL9HXydUANCyn0nliO/vLmu
         SAMSa0DL/xyUFDZTeUCXAb0Njk3k25pzMEOViUxUz6ulEmMT6nGoJqiilqm2SO1LglV8
         Qwdw3ieCVNBu1mdsgHuImi8KVmhRiH/lsGpAg4tkJA+iRw/y/xX9emaOk1u6ZAId2csD
         iGJDu1WRJ8ptuTXU7IbeUu1Qw4GPHdiIyUuaUEW9bIOu+s/7JewwAHgki815w59Eo0OW
         GwW8hVMWuMzI1bl+wRSE8uuNDsxQrMXjyeJi2Uxt/RbnfF1ZCX/i++xAQmNWoKjAZAHK
         R3Nw==
X-Forwarded-Encrypted: i=1; AFNElJ8EdM5HvLgchRYgRtU32+uInLdnaM4cfVS3yGogZYcFzW+AX/00SRlAe1//reK7gH6tGtJMmLyvvEE/WKu/suSq@lists.infradead.org
X-Gm-Message-State: AOJu0YyNa+ToZWEatTd8sLEfEdZvRCpElTz+WAuQUH7LkW5zrWoSue7d
	ShYXSXyDrUgmDDiQqjO+6krRXgkIm5GrNASg0cplsrWFAHqIRFXPaH9sfAnqOme8
X-Gm-Gg: Acq92OHAVhlqBkHji/XqvBX6usVTVz9/L1iZLomwSlThD4st9a8Cmn4O8n1F6yTOjc0
	HG7eMJ80mOiJP9NWzvoGY+6YbHDHJLEBAVXKHDNC6zYqOPIFLRj6mM2p/Byr5gpH36igU+zWb3L
	FZFhqZQPysvG8Ih0RJZg2DY3t90T5RXIvxCJzlPpBtaiYEN0b05Q66H7eNO6S7C77OD8b/WV4lH
	LYTOSh79CtpQtnLkCh/tNiTV4IDo/H2Lp3C1+m7lJVn9KvspbIbtxtqrWZFmZYXBCFrdgWSc7QY
	Qx2b6nT41KiSz0CWD/9JzlUqClE+OXoCc26NJvxVBjMncgbpmLbOnUK13PXwtXrudAzj7Beftf+
	zo/AQpMTfmkbFqjCts3lRi8tjIBoUVOqKde4qUiyAg/wdBa009UMm7QHgNpwZWn8mnCyuOn2FX3
	fuFKctqKQ36SZdhFEJQHmwGC12ZITcB/MtS9fO23fkjZtqIX/tDl8TkaIDAMZvJzfKoUVUS4dJ1
	7sL8ePGyg==
X-Received: by 2002:a05:6512:2248:b0:5a8:f03b:a406 with SMTP id 2adb3069b0e04-5aa0e73d743mr115331e87.16.1778785142331;
        Thu, 14 May 2026 11:59:02 -0700 (PDT)
Received: from Shofiq.home (87-92-218-151.rev.dnainternet.fi. [87.92.218.151])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164bc171sm647750e87.40.2026.05.14.11.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 11:59:01 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: Md Shofiqul Islam <shofiqtest@gmail.com>
To: nm@ti.com
Cc: ssantosh@ti.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] soc: ti: knav_qmss_queue: Implement resource cleanup in remove()
Date: Thu, 14 May 2026 21:58:59 +0300
Message-ID: <177878513972.16124.2519778203402988912@gmail.com>
In-Reply-To: <20260506154114.2288-1-shofiqtest@gmail.com>
References: <20260506154114.2288-1-shofiqtest@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_115905_436956_D8C46598 
X-CRM114-Status: UNSURE (   9.17  )
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

SGkgTmlzaGFudGgsCgpHZW50bGUgcGluZyBvbiB0aGlzIHBhdGNoLiBZb3Ugc3VnZ2VzdGVkIHRo
aXMgZml4IOKAlCB0aGUgcGF0Y2gKaW1wbGVtZW50cyBleGFjdGx5IHdoYXQgd2FzIGRpc2N1c3Nl
ZDogc3RvcHBpbmcgUERTUHMgYW5kIGZyZWVpbmcKcXVldWUgcmVnaW9ucyBhbmQgcXVldWUgcmFu
Z2VzIGJlZm9yZSBkaXNhYmxpbmcgcnVudGltZSBQTSwKbWlycm9yaW5nIHRoZSBjbGVhbnVwIGFs
cmVhZHkgZG9uZSBpbiB0aGUgcHJvYmUgZXJyb3IgcGF0aCwgYW5kCnNldHRpbmcgZGV2aWNlX3Jl
YWR5IHRvIGZhbHNlIGJlZm9yZSB0ZWFyZG93bi4KCkNvdWxkIHlvdSB0YWtlIGEgbG9vayBhbmQg
cHJvdmlkZSBhbiBBY2tlZC1ieSBpZiBpdCBsb29rcyBjb3JyZWN0PwoKVGhlIHBhdGNoIGhhcyBi
ZWVuIHdhaXRpbmcgc2luY2UgTm92ZW1iZXIgMjAyNSBhY3Jvc3Mgc2V2ZXJhbAp2ZXJzaW9ucyB3
aXRoIG5vIHJldmlld2VyIGZlZWRiYWNrLgoKTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
bGludXgtYXJtLWtlcm5lbC8yMDI2MDUwNjE1NDExNC4yMjg4LTEtc2hvZmlxdGVzdEBnbWFpbC5j
b20vCgpUaGFua3MsClNob2ZpcQo=

