Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6869CCCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 13:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qx/WLIkX3FuLLIRvr6wXXZfUggNICjgo22DnjBHxXpg=; b=tfKVKsB1eaMUSTCjPp6L9xoo7s
	qNoaws+qJNgtfZCepKELeq+Zgq1TxMlqMaF7Hc5DSJaufrCwf8gRr6Mqh75jJVQLBzO3L3MdRBKuw
	Y3MlGqgOWkjm1mOkCV03pSCLnyzlWL+VK+tecFhdlNPEK49/ZPxf8kw9AsKpxoqib/tFdhfF2aMVP
	Gj0w/rUOsVwUL4QLj3rGHe2nNG1ndg4gZI6sSftmRQv8IQR9ArGAcqCvu1YPiPI/OgTCmPbF0xgc0
	MDGQbDzf5xdLN4iEDoIj97nHWgBVeJDQHN9w6iIJ0191PZmxZd1jo+SwVbsN8kBNSYSl5KxFrctPS
	1itJ8tDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v91bE-00000001iUJ-3TQ3;
	Wed, 15 Oct 2025 13:31:28 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v91bA-00000001iT4-2t1s
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 13:31:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760535082;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Qx/WLIkX3FuLLIRvr6wXXZfUggNICjgo22DnjBHxXpg=;
	b=G3NhcNrX3QsRn1WFVenBLBX/dbEQFhYPYWMgugR9c4pJMnsulX/1iKxsrGaQ+kgeWof7HO
	QBS5iP+Em9Xbb75u9eeT0e36PurvONAl96KLhI7tSJK6quCgcW9IA6Z06Z7ET2HM+LlkZX
	bixRntbGdMf7c06Fo5/aodgI4ECcgrU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-146-ycFNmf4AN2q_09CB-LzQlw-1; Wed, 15 Oct 2025 09:31:21 -0400
X-MC-Unique: ycFNmf4AN2q_09CB-LzQlw-1
X-Mimecast-MFC-AGG-ID: ycFNmf4AN2q_09CB-LzQlw_1760535080
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-470fd49f185so6305845e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 06:31:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760535080; x=1761139880;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qx/WLIkX3FuLLIRvr6wXXZfUggNICjgo22DnjBHxXpg=;
        b=tVv42WwQQiouw0lx65PStDYFJqtk6JnZGKE8TTVReLqlf+1IoMCiF3B693i1vHVe16
         KJQ6XtgpVe9eHSF6K9Qw7bY71zETTWs7GFBZn0QHK0mqpZEJDhF8mxWeWsJjxadZeQO/
         hVwbb2w5rMPYhuy+0x+MKzoXN0HYUA2QTQQIpJ7UeTyLEfUJHeHN1KosJxULMJIxiw0u
         JiplJP6o7R5EL6rxTbmkSQTZ/FV/RukgMSPPfY4JZAdymJW3SBK+Gqep9S5YJLsAfQj/
         B2W6w83KAFD+p/0A+us6m8xG3eH9IDYF4WrEk4ac4Ed5RET+UKWxOfMYAudkebpCoWWb
         elFg==
X-Forwarded-Encrypted: i=1; AJvYcCV2ff+J39U0CjvUmy01Zzn5Zac0iZxuCguRgJY5Tg9FTEG90Cin5o9aURk2MijOU8Bh7FYwVQJQVZl9eFKLY5Cr@lists.infradead.org
X-Gm-Message-State: AOJu0YzasoYrDRrLdvewufS/q84gGpzhx9w8lrUrnhfwMQjBioS5Bw52
	MBSw5t9w8MVfjRvYE6y1fMjzW8pzHmynrm0YJBS4VjJ/c2K8oJgU3P/NjBKFPRT91DVTgJoAYFJ
	kH6DvFFdx477bB0uAvIZYNfEI/G2XNm+W3wVlGk/B4UI/NB1HTiqhlxeDWllfEt8peoJF8Wjlup
	wq
X-Gm-Gg: ASbGncsmrZWT+J1W6bYxRCLI5psBu4wYyOk+Zuw68iqzR/TB1z2G4ZrKdHOMZKUK3S7
	KjETJQMxaCjuyUowlF0iTLnjc0DlA538XRDLRJFVNAooHgnPgSoJs8z+c+1u0A7f+vT87eCtT7k
	zWjZY0uBc9vah0bYo7a4JcR138nUI+RvcvKOizDtd/d7eMChIqeN5sm5QNaXaYTS4AhHOBO2oMF
	opwf13kYpoeK1fSD18GiLIAx5BCRHnENH/W/LzH9OO2rxgNc0zsNOO5lN1BuYTiBSszLh7fxlH1
	abF/f4auNq/u3WRbshHkoQzHGJDAdmkb2KHvI+NBidCj/iwp8rQl8xyZxiO5QWcLUCdB01XEQOI
	k6a28VZZwR0I4Cl9tM3dlzws4MY1XnWpg2upJNdNiNts=
X-Received: by 2002:a05:600c:1f06:b0:46e:384f:bd86 with SMTP id 5b1f17b1804b1-46fa9a9443fmr180403545e9.5.1760535079980;
        Wed, 15 Oct 2025 06:31:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+lnTVA9bwGzjwuoD5HESi6s46NjZLx8ClZtJP3TmDc/as04XcYPb2mz8vb4LsH6wKJD4ZoA==
X-Received: by 2002:a05:600c:1f06:b0:46e:384f:bd86 with SMTP id 5b1f17b1804b1-46fa9a9443fmr180402875e9.5.1760535079118;
        Wed, 15 Oct 2025 06:31:19 -0700 (PDT)
Received: from [192.168.10.48] ([151.61.22.175])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47101c21805sm32779375e9.10.2025.10.15.06.31.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 06:31:18 -0700 (PDT)
Message-ID: <81af1654-5cb1-405a-bd42-670058dd22b6@redhat.com>
Date: Wed, 15 Oct 2025 15:31:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] KVM/arm64 fixes for 6.18, take #1
To: Marc Zyngier <maz@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Jan Kotas <jank@cadence.com>,
 Joey Gouly <joey.gouly@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Oliver Upton <oliver.upton@linux.dev>,
 Osama Abdelkader <osama.abdelkader@gmail.com>,
 Sascha Bischoff <sascha.bischoff@arm.com>,
 Sean Christopherson <seanjc@google.com>, Sebastian Ott <sebott@redhat.com>,
 Zenghui Yu <yuzenghui@huawei.com>, Zenghui Yu <zenghui.yu@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org
References: <20251014122857.1250976-1-maz@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20251014122857.1250976-1-maz@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: l1wdXKNMayEnkZ1baciGCf3QdqYtFLl2qbZo5sQl448_1760535080
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_063124_799480_1091AC50 
X-CRM114-Status: GOOD (  21.83  )
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

On 10/14/25 14:28, Marc Zyngier wrote:
> Paolo,
> 
> As 6.18-rc1 is out, here's a collection of fixes that have accumulated
> over the past 3 weeks, addressing a pretty wide ranging set of issues.
> Nothing really jumps out, for once, and it's the usual mix of UAPI
> tidy-up, architecture fixups, and other random cleanups. Maybe a few
> more selftest updates than we usually do, but I'm sure this isn't
> going to last!
> 
> I'm already looking at some more fixes, so will probably be back next
> week with more presents...
> 
> You will notice that, just like I did with the main pull request, I'm
> adding message-ids to the tag instead of putting them into the
> individual patches. It looks rubbish, but I don't have a good
> alternative, and I'm not prepared to remove provenance information
> from the stuff I ferry upstream.
> 
> I'd welcome any guidance that would make things suck less for people
> reporting bugs and backporting stuff, despite the "Link: is bad"
> nonsense. Preferably something that we can adopt across architectures
> supporting KVM.
Because you're already unusually meticulous in tracking tags, I'm going 
to say whatever floats your boat.  If you want to add it to each patch, 
I'm certainly not going to be the one to complain, and/or to make your 
life harder, because of something like "Link".

Personally I think that there's a different between adding something 
mindlessly as a cargo cult, and adding it *unconditionally*.  Link is 
the latter, it's unconditional because it may be needed *later*.  In 
some cases it may not be strictly necessary (for example the tip bot 
used it to send replies, and that is served by notes just fine), but 
overall I don't get the hate either.

In fact, I'm very adamant about *needing* Link trailers for each patch 
in the RISC-V pull requests, which are the ones I look at most closely 
since the code is still in relative infancy.

Pulled, by the way. :)

Paolo


