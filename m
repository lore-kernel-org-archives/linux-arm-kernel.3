Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBC92CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 13:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xai4BMJpzMOlsgKtlGy9Mhd++HQsN5X/QwvFrspNawk=; b=vfHgMAyQkNCWQdo2ss0nuxsWhE
	jVg0HaZuC1y1UcHh/iZPzz6OMTmHYaMaSajNxeE438DeRmmRyeVoj8+PvLOzkUBKKKeLephWf882Q
	4nIf0mVc4jm3nv2n3B0eMzNHRgXwK6cXgXX6/+D+C6XY7nCJzILt8Ct5TsXSYqNRqd/dWJeKu5zrQ
	vCVL1c8u2QnYhl7rwvF3VPhwHFVNo3SQn9DBvNjrL4tw06KcSXRtgIIvNO1uEKLppA2PweKIhONG+
	8sYLCqpUvUXcS1MOapQSExYBHj8vM9oP/qZVaey1zcEWvTtSzQSHYs7zHZkEyEsAENKRNa/TiCUUY
	ckwGkdMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzbVe-00000003263-1Wgy;
	Fri, 19 Sep 2025 13:50:46 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzbVb-0000000325b-3bjG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 13:50:45 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-45ed646b656so21009595e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 06:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758289841; x=1758894641; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xai4BMJpzMOlsgKtlGy9Mhd++HQsN5X/QwvFrspNawk=;
        b=JxvbDQo+Ym+DlRax8E9Q8MJ6ZJfDcKjihgriwKq/V+OgYeOua8vv/2fZFtNB06jTWI
         tTfPrb8EmRxpghfKIXko9aFJP/m1Q5WkDuxR3BHmxgmyfnCDiMfmO2iiZmXGegEEnuq5
         ySSpiMR4XNNi9CCRrpgDgXoymBK016Tf0GCYpOI2NBLtION8Ib/ctNdOmxiRDtjP8P+h
         4pQPwS6BzYczzdYz9U2w6xbdunA6u7WXoiWfP9nLBT9WYgFPR/n2+rbwA4JXhjoSwkTH
         BQmRvNRth9H+XETq/aKyCpwcGSq/BLFgT+1r+g9DNkBnQQw9VhfDj3gLmWy3jnFoVqEu
         fxSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758289841; x=1758894641;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xai4BMJpzMOlsgKtlGy9Mhd++HQsN5X/QwvFrspNawk=;
        b=CLmyG1cX9DNdu9kNYB0GPHDxI59eHQGqNuLDwlPuV0F36QfSSMQUpnxqjfQnfhtdOR
         ZwXQ8qSPcVsgBJ47XgiPAXYEiCA0vfiBgMyeBgPGopPeVSSnTH7hF8mcWBhCaWLNDeSE
         BFZyb/IUEkbu6i5xoI4cPnILPyd0W3hvxWaF2EYDmOKV74qYEzOm9zITL1BCU5IFcPjp
         v7LcQ0XJEcASN4AiI5YAnv9VhDx3gN++tBHHNlMPgs9euasPSZMMJyOwCuM4DtgXXz5g
         3xL53iIb7E+oS7TfdNJFEML4sNCpAjMtGvj9ulTf59UtFLF3RBrMCjq5FO1HSFs3S4rC
         wnqA==
X-Gm-Message-State: AOJu0YwNo9fr/S/WCC1CAWCWpd9ha2JUhHun5WzqW/hlJnopU1tVW/SF
	oswCUpcXP0/6pCRtxae/59Nm8oICykoVbRJux46/rha6UtasyXjC2PBq1i104Ifxrw==
X-Gm-Gg: ASbGncuXUvoQ69hbXnkaq3uZI+zkbT3jgT3aCX4pJ9DUQpgpipl7zn4byKRSnE/hMp+
	ATnQdkhB2LxLdak2RMWzDrLL1KGTpPtk4mKzPCc0JuWkMpExFX/lXm1Q8Oua31f+k7oaV8Nm33J
	RgXhdu8iestfIQL0ZHNDutlF9valxXQ47w1hYSvYjcdpumC54r9om77mtqQi4L1J1/VuCubb6VR
	wEF7AJgnNjd+z/WlbGOwXn4x41pUO1Dgr0+JVXGscQBw37XtQZAla3GsZwwvyvBwbMgBQ0hp3AV
	JD1dfkl9c0PfuHohuSAPpI57OB5FWETEnRbKCouj4h9dIyxVMP1XbWIDkmjp2j7s95N/ra4ZIUw
	1fzTq0/+WXXZmatowID8GSfT56+Yg+KBDACfo4rAHOU23Tu5Ef86cKX+E
X-Google-Smtp-Source: AGHT+IHLBRjeIOmwepzIuF01y2vjTOTw4vfDjlIpjs9wyQ9PtZAniRUcK9H5VClvTF7h/XK8zSVaQw==
X-Received: by 2002:a05:600c:4ec9:b0:45c:17a:4c98 with SMTP id 5b1f17b1804b1-467f00c33bcmr25435665e9.19.1758289841283;
        Fri, 19 Sep 2025 06:50:41 -0700 (PDT)
Received: from google.com (32.134.38.34.bc.googleusercontent.com. [34.38.134.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-464f5a2850csm85352675e9.19.2025.09.19.06.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 06:50:40 -0700 (PDT)
Date: Fri, 19 Sep 2025 13:50:37 +0000
From: Adrian =?utf-8?Q?Barna=C5=9B?= <abarnas@google.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Dylan Hatch <dylanbhatch@google.com>,
	Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 0/2] arm64: modules: Reject loading of malformed modules
Message-ID: <aM1frYteFpv1zVr7@google.com>
References: <20250919122321.946462-1-abarnas@google.com>
 <CAMj1kXGe=HR7EvMs8D=7Uvr4Vhr7fXp56YQ9A10xdF1V1M71zw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMj1kXGe=HR7EvMs8D=7Uvr4Vhr7fXp56YQ9A10xdF1V1M71zw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_065043_907690_DFD4DE28 
X-CRM114-Status: GOOD (  16.10  )
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

On Fri, Sep 19, 2025 at 03:17:29PM +0200, Ard Biesheuvel wrote:
>Hello Adrian,
>
>On Fri, 19 Sept 2025 at 14:23, Adrian Barnaś <abarnas@google.com> wrote:
>>
>> Hi,
>>
>> Here are a couple of patches to reject the loading of malformed modules
>> on arm64 when the SCS patching is only partially applied or we detect
>> an alternative callback function used in the module text.
>>
>> The SCS issue is largely theoretical. The code currently performs
>> a "dry-run" (which we remove), and leave module code as-is if failed.
>> However the latter issue was reported to crash the kernel at [1].
>>
>
>Why are you fixing this largely theoretical issue along with the
>callback alternatives patching? The referenced thread only talks about
>the latter, right?

Hello Ard,

You are right that the reference thread is only about the alternative
callback issue in modules. We found the potential SCS issue while fixing 
this. Proposed resolutions are symmetrical. That's why it is in a single
patch set.

If you find it incorrect I can split it into two separate patches.

Thanks,
Adrian

