Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E6FC5DF89
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 13:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=93TKIYVELb3f7XMDYi0bAF+lcotYrliPfpYhNsdjWuM=; b=xR2N4Vws2e8zS7pNvFTWODpX8n
	//aLcUCZ5ty3lSGC6I4x+HiQbZqdLOblkZAI/SaRQKzuVRroCtCrmJ9vEpiGbda2PcGUimivbDCAo
	lsP2wTlMv+PVrVeg1MiGZ/JmvchZHxhqCh8yBHrKlOkuIU7ps8D/QE8K7cvxmGEVGAMvrh2n00ghb
	gZ9+EfTyyFUC06wgGCU2cgp0WlmGWgdmOVafPZXid+tILouLuUM8/imeJSobkq6Bub4iZz7m9Bn7N
	vGjpzwiWfObz3vMIekyRkEI0OXreinybwq2ZqImGgd/PEIc4U7HOoH8LnqwuFH5/Zb5c9H6njEkVx
	Zk9ahAeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxPHA-0000000DOwy-3vQk;
	Fri, 21 Aug 2026 13:27:16 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxPH7-0000000DOw2-3VIu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 13:27:15 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-47fecbbafdaso348573f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 06:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787318830; x=1787923630; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=93TKIYVELb3f7XMDYi0bAF+lcotYrliPfpYhNsdjWuM=;
        b=iHNCyDZrHmsvz+tBNrYZJKG16VOPBuAmkLxxxkEgSX5AEv0M1cy68Vzec9S1YMzdaH
         zVVjY0Alh2CoBUItyJXAeMdDvS9//4PyVdrKRa/lQztX1uzImDcxZEoyUS6Twldu9zVd
         DTSjO06KEqhk/6ppeVY8Z5op4vpD3rPEic43LGpefesB2z6LvdK5RfJ1NI85jErXMGfL
         aYVF64fjq2S3ivHesEUe+XtA5XSFRaFwrSMEBHSo1V2KxVlrzDngKOe7ZGUqKimzjOsu
         Jc5OGBub7CesEEVtl5vzwQ0A5zH4PYFTLDUwJ5gEcZ3yuUjyzj28lXUFwaJsE+eXUFBc
         qUnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787318830; x=1787923630;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=93TKIYVELb3f7XMDYi0bAF+lcotYrliPfpYhNsdjWuM=;
        b=q8qBfUKekiRXNiLBJktilVnI5/s6IeuGSAX4MNQuq+LTzPwWJICwx/WyJdE+5PZiwT
         pvClbkIPQzBsuLnZLgIrgw9S5lXE9o44fKvaD0cMaT2h/YC2KsJKG7gvp76I/T5XG39i
         CgxKJ1dMBMpurGrTVk6dU0S8F8LTSFkIbfPBw/Ncsf/FE1FkZuru3WJd3kbjq0iqQ9YA
         qE9SK0PCAej0kmddD4eIYxUi9oWJtYhYKUcJg29/6SUfw+ZzT3Z1DYWivWGSNYuVSZ2G
         Alp9rX+I5yjY992anesOkHayX2aK1jfAjBCGV+/WHs/EnzD+RaCIpCs+GXRYHsNUWutj
         9FCg==
X-Forwarded-Encrypted: i=1; AHgh+RoKa7hRFELcZxmi7c3ag02iglIH9I/++JCZAh+azlAsG9Yo551UuM7Nnn587D8Lw0g9JK/vX8vFQgxZYYQxK6AY@lists.infradead.org
X-Gm-Message-State: AFuF++lhHyYVueSlh4PLn1oM8v0ALsexydCq9Vvk5IyE/vgz7qjLoH0m
	p/SDoF5CxxIDILwaUIjPjC8L5dboIbgxNAFQ4Z2Q9Qbi4mYkVIzQCxWn
X-Gm-Gg: AR+sD13nanESvbrxx5reQStXJyp7GgScQWcNrUZASiR8CvKJ96dPjZFpcFpbTUA7rG/
	Qab+SYLWNnQzJuVFE5IghNnzWzWrQDTZGDZEDyTpd8KkiCmR7diQrGnjuNVI9LBHityPd2T1/WT
	vVzFR1l+Omg+dWg8WcD19rXScdrWXm2G9qvMjxntOLv4708Hu8dZOD+hk8WK0AxPPOcCiWCNGE2
	FY9RPoArxPvsBXnKNt8cJZgxlUxwsnEUUQAfoIg3z6WVnqox+z9iypS5CaYMk3ne1ySNzt6GdwG
	ndWgXPrXnOmyHBhYtya5UjG7Ve+uuUdP/TRL0dSGp6a0TZ7byddhy7dzVRKSpXLicIZ9uxXqoqi
	y557CMsxh/HHFR50CQwb6/aYCHGdF6oVdLdE2gmqfh0KiRMKQlUYYD5nzuqgLQMHkM/d0gvTq4o
	BsS1Rw/TxFf8VQSnuD+keh6tw4x7GQR8HVpgB5kU3tL98f+xR+nT9+Bh6DrmM5hWnzkqXs4hgkL
	fd0BQ==
X-Received: by 2002:a05:6000:41dc:b0:482:aa2a:52f6 with SMTP id ffacd0b85a97d-482c0b41f95mr10002245f8f.1.1787318830006;
        Fri, 21 Aug 2026 06:27:10 -0700 (PDT)
Received: from [10.45.28.226] ([15.248.2.234])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482bf82594esm3408856f8f.29.2026.08.21.06.27.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 06:27:09 -0700 (PDT)
Message-ID: <12442106-e756-4902-b9fd-c760da04f849@gmail.com>
Date: Fri, 21 Aug 2026 14:27:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] KVM: arm64: Add pre_fault_memory implementation
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: maz@kernel.org, oupton@kernel.org, pbonzini@redhat.com,
 joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com,
 yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org,
 shuah@kernel.org, corbet@lwn.net, vladimir.murzin@arm.com,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
 isaku.yamahata@intel.com, Jack Thomson <jackabt@amazon.com>
References: <20260612162354.73378-1-jackabt.amazon@gmail.com>
 <20260612162354.73378-3-jackabt.amazon@gmail.com> <ak5sAxb3G6hhFmBF@raptor>
 <alEXGmKiXgWPPdhF@raptor>
Content-Language: en-US
From: "Thomson, Jack" <jackabt.amazon@gmail.com>
In-Reply-To: <alEXGmKiXgWPPdhF@raptor>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_062713_888933_66A0FF9D 
X-CRM114-Status: GOOD (  13.57  )
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


Hi Alex,

On 10/07/2026 5:00 pm, Alexandru Elisei wrote:
>> Does it guarantee that, after it completes and returns to userspace, the
>> address range [gpa, gpa + size] is mapped in the VM's stage 2 tables? Or
>> does it guarantee that the address range was mapped at stage 2 at some
>> point during the ioctl's execution, but parts, or all of it, might not be
>> mapped after the ioctl completes and returns to userspace?
> 
> Nevermind, spend some time thinking about it and it turns out it's
> impossible for KVM to guarantee that the memory is still mapped after the
> ioctls returns.  So I answered my own question, thanks.
> 
> Alex
> 

Yeah it's best effort, as if a vCPU had faulted the range itself. This
could be undone by an invalidation or memslot update. The value is in
the common cast (for us, post-copy migration) the guest doesn't pay the
stage-2 fault fault cost at run time.

I think it would be worth me adding a sentence to the documentation
noting there is no persistance guarentee.

-- 
Thanks,
Jack

