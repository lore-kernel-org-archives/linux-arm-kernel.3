Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E63B8C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 20:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=RtzxPj829hxx6a8LNGtfeNdfTNyEQAZxil+yeQpRBG4=; b=ebYvBpKIsbmjN0
	f8Dregpq7qOWKBec9btuAglBu6It/n+vHbFAsLA8zaYd809VuluHjNYnbdCd1az1v63G59ulgtQ+l
	NVzPcwvaxOlLg/ohy7TucWferAO+LmQkljiT80fzCoupNvYY2SldFBVe+x8hoBmsxYIFo5lVdu9mM
	HwZ6HO2N6KfZ79411F490WykWj/o4ffThf28GWIwHC/06sR75rX5t+LE8Ocy2/SV5/H7FB02oPCio
	5Hfp4KRTHXGPFoIQ1ehnqawJolZ1OiblERipLk2b4gKOk4Sj9UvNRDIxlhgwZq+r2EHXQS7b+DVE7
	w0h8N2GQ99mCe13mSkaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVFzR-0000000FnBm-0kCh;
	Fri, 27 Jun 2025 20:48:05 +0000
Received: from mail-oi1-x24a.google.com ([2607:f8b0:4864:20::24a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVFx8-0000000FmcD-068T
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 20:45:43 +0000
Received: by mail-oi1-x24a.google.com with SMTP id 5614622812f47-40b27ae3317so255978b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Jun 2025 13:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751057140; x=1751661940; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RtzxPj829hxx6a8LNGtfeNdfTNyEQAZxil+yeQpRBG4=;
        b=O3S6rTC6j96Er7xNlsZ3k1K6DX1i6LIF1xwZfRxpnAdyrJN+LTcBNGG4XkwB4wCp7a
         OmGumqNdiaqyuhsZZWjHyWiwxMi+pPsNvLABQkQVMeTaLXMdo3zwfPQM/b0oqqHhwGko
         EO59XDUr9DJ0XmyKURjw2fW8T96Fo5BI93DK8OeKKk5CR4roj/SV0iRbR97gfYmeaVV0
         C65Vj2o0cQgJJL3clpmQ1I6HsmlxCmt37fE9s2xrZokrSWxCY5F5X/GdoeZoFEK4ai90
         eNydj5V19IPaJWc5QHUq8RBoyxgfbpnMZs6UbaY6Pr2lZy/3vsY88hhVhgEw8ZcSk0d4
         UVtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751057140; x=1751661940;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RtzxPj829hxx6a8LNGtfeNdfTNyEQAZxil+yeQpRBG4=;
        b=tzD+3k5TnDs5xCGN6/ZixK2ly84QBJpMt7eGrh7t39Y4ucRgWa5Y6hzMMwXDVfPhE+
         xg4TrVl8lCpERpIZTSeczRhdT1Gmq58Nf+2Y6zJDDlBq3lICsJr0g0iB21VtE/5M8FcE
         BOBOlfCU5NdJUlwT3RLmCjSgJPwXUeOgMS7ov89z2YLhm+aulRpG4DLh3D/EGdepRjO8
         +w44IlZrKo6Y8sraHpl6M5Z26VCYEfHVjWPriQKzAdLYlxCoFfHiDzKcQIBhcgx0oOJW
         og5Ionlzl22iij6MoMdtCp7gfB3g+tf4xSp0nv9oqNUNS1QhQsjGsHhoQgbYQCLtoNUx
         TFcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXASCB+O23DQPlbP2n5yTiSwM1WG/cqy0VoLEX7BPvVAkyUVqAL0jWNggx5lJ5noDWfdXZCbIH9SVpeLfayZi4m@lists.infradead.org
X-Gm-Message-State: AOJu0YwkcdVFznF2IK59PxAQFvDMg4Wu8GDHF0S1pIEllNLBg439QNQP
	KCYgHTPrqiTXxTcrViDYzMK8LPG+nv0oeqmdm5RhJF8kNKuJwIZCfffmuKGkZXLv8CT57/wAoQs
	fzrmVP62m9hWjtJ/K+9qxVIsvDw==
X-Google-Smtp-Source: AGHT+IEVJG2F41QRpFsQcHOZM3LLETHwJl5cQHVqdrJwuBS7mGDCrIIEijxTBzEQVHHKwtJ80l+vFT15a5JN0DRDMA==
X-Received: from oiu5.prod.google.com ([2002:a05:6808:80a5:b0:3f9:9583:af9b])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:21a7:b0:406:6e4b:bd91 with SMTP id 5614622812f47-40b33c489d6mr3625383b6e.7.1751057140014;
 Fri, 27 Jun 2025 13:45:40 -0700 (PDT)
Date: Fri, 27 Jun 2025 20:45:38 +0000
In-Reply-To: <603eb4c7-5570-438c-b747-cdcc67b09ea6@arm.com> (message from Ben
 Horgan on Fri, 27 Jun 2025 10:04:21 +0100)
Mime-Version: 1.0
Message-ID: <gsntecv49aml.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v3 02/22] arm64: Generate sign macro for sysreg Enums
From: Colton Lewis <coltonlewis@google.com>
To: Ben Horgan <ben.horgan@arm.com>
Cc: kvm@vger.kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	maz@kernel.org, oliver.upton@linux.dev, mizhang@google.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, shuah@kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_134542_061123_24CA8CF6 
X-CRM114-Status: GOOD (  17.97  )
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

Hi Ben. Thanks for the review.

Ben Horgan <ben.horgan@arm.com> writes:

> Hi Colton,

> On 6/26/25 21:04, Colton Lewis wrote:
>> There's no reason Enums shouldn't be equivalent to UnsignedEnums and
>> explicitly specify they are unsigned. This will avoid the annoyance I
>> had with HPMN0.
> An Enum can be annotated with the field's sign by updating it to
> UnsignedEnum or SignedEnum. This is explained in [1].

> With this change ID_AA64PFR1_EL1.MTE_frac would be marked as unsigned
> when it should really be considered signed.

> Enum	43:40	MTE_frac
> 	0b0000	ASYNC
> 	0b1111	NI
> EndEnum

Thanks for the explanation. I made this a separate commit because I
considered people might object and HPMN0 is already an UnsignedEnum in
my previous commit.

Do you think it would be a good idea to make plain Enums signed by
default or should I just remove this commit from the series?


>> Signed-off-by: Colton Lewis <coltonlewis@google.com>
>> ---
>>    arch/arm64/tools/gen-sysreg.awk | 1 +
>>    1 file changed, 1 insertion(+)

>> diff --git a/arch/arm64/tools/gen-sysreg.awk  
>> b/arch/arm64/tools/gen-sysreg.awk
>> index f2a1732cb1f6..fa21a632d9b7 100755
>> --- a/arch/arm64/tools/gen-sysreg.awk
>> +++ b/arch/arm64/tools/gen-sysreg.awk
>> @@ -308,6 +308,7 @@ $1 == "Enum" && (block_current() == "Sysreg" ||  
>> block_current() == "SysregFields
>>    	parse_bitdef(reg, field, $2)

>>    	define_field(reg, field, msb, lsb)
>> +	define_field_sign(reg, field, "false")

>>    	next
>>    }

> Thanks,

> Ben

> [1]
> https://lore.kernel.org/all/20221207-arm64-sysreg-helpers-v4-1-25b6b3fb9d18@kernel.org/

