Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43540CCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 18:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PdRUynOgPlBXPJo6ql5MWyX9Riir7hsBESxiC86Kk1c=; b=uGXmAlfLk6dSwiCHIm9BRFLhf+
	EKbkWJMHd8hpfGcl1BVN7kJpDS1KlK6aFqsYt7qH3BVRs4/rVS1+TWBRIXGka8ygpRMWpYKDq9p2M
	4epzJNLmldJLH9GKhM9TtFp9R4XJgDl826fY7wsGkTREi8WOu7exuFY/5InoMzWwMxw8JH4aBOn4V
	DfseRzmEZ+w5l/+pr5GtUSoDqofpbkxvkZj9jK3K4xAunYXOpIrujUZzN8q9tb11XEFdBFLzPgxXE
	qpYuS7S2VEJ13TgLqzth4r6eeNJdMvANxoiB+f+zefob0ETfrgOlociGHlrG/GadVKS1g/eOFkNHN
	f0qnacKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vItVv-00000007du6-0ARN;
	Tue, 11 Nov 2025 18:54:48 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vItVt-00000007dtd-0QYo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 18:54:46 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-42b32ff5d10so732529f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 10:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762887283; x=1763492083; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PdRUynOgPlBXPJo6ql5MWyX9Riir7hsBESxiC86Kk1c=;
        b=Wh0ZH3lBIrhP2NEBguVzzMjMxXoiyfhw9py0lHqd66ls1PcZzJblqlQjbGk0NrreK+
         yTBHhc0i4I8wPj5Cz90/fmajkscelhKdr7yg23HbKWweLGja1nP+StuGejX02e+0O4Jd
         KGbOzV6uhiaSy15aGuLhXpPZBDQgjIbSkwbdw+aQRa9RL2I+joG7v4KUdS+RuCUMroDN
         8PcywQosGeq1CiCV5Olnb3CInpHCqBZkSPJ9duZkYMhizkXeEGfKTyPIeN420NJxs7IY
         4U5iICAbzJCeVg6NQGQAK+/+PhTRw8yjngOiysfIbDMqp6cNoFdJfTu+Vbay2XVafugU
         f0tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762887283; x=1763492083;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PdRUynOgPlBXPJo6ql5MWyX9Riir7hsBESxiC86Kk1c=;
        b=V2vmQa0kGAVz8aINIc47CP8i6DURyLthBaPLT2fetUCzX4tKfFz3LrfeC6jA2+UWAJ
         sOOWj2sXy975LaaZmAnuzyHrISwN5ADbnPh8E2OqewO0n+wqcTuN4GFZ1hMwKynleITg
         ggYpwBov0lHTmiFLLTys4OEekGathDLiR/FnSp/FlVpqCviS/0i357FwUvENoBjYhQXU
         MJ1DSMWYzyytoop78F9jkIeuSCBt8aNfsnn8SNOGcEYBE0U6sVZgMUBREo+BMw94xUFG
         MhbTC9A4BlkBDR9TUaz7zfL/UkPfQ7S6Bhy8J3huFerAhcPBHPljo9DqvVVEk0imhJ0K
         aVHg==
X-Forwarded-Encrypted: i=1; AJvYcCWGJ0WS1INeTTZxk8MuTfI1hG72bgKSmeL3PMh/uXJ1bb4qMvFVrgYL6UK6bX6XQbzrqhgSV17kfHhjLFWQrBWH@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/VahLdP03dGlrKHMhAOv1bbr/qkUINuC3fr8ic/e+Y5cndlT/
	v0xxNTGZYXnTZOv+0TiEpFK5EnHCGByoGDHEamdxFYrlT8yIBjof8/5d
X-Gm-Gg: ASbGncs2b0SW0kuvxw4+V2NhYJm0Bbnm1hyRXq3rtqLNW9TmRNaQSNfO9V+UVMnVwUe
	2LbIijXKIFOl1lME7WRAzNuZy66ib50ziem28Y/n1HfwML5S9S8IEgpU4wRQvvI0UjIKNTgr0NQ
	NBEL3qmzxRv0PmSZEWlWVkM79WpuJl2Etf6FeCDqIeIUNLPhjLrSposmoBUq7nwAtsV7Z3weh0Y
	hBajIgh45v0exIgwsG7E07InYuW4KP9JamUXPf/Es3cyhz57wq9iUOIS4h0AzdvS4IvjU2Rd0xh
	QT0a6jlQov39yYRCacdt7Q4ihDLb434aKBL0p86vugO9sy80zH1djm5cxe4lcY/0CZCfvKwgES+
	sUOfQ9138ZlkCHU081zy0+0qspQCwxNpDS1wS9IWyYywu/M4ARVU6UByxYh/vIXqRS4ZnkayWoh
	3AxCikhWccRw==
X-Google-Smtp-Source: AGHT+IGd0fmmG6z7kuRrMZdV6g6rc2EMUpgF61dCExt4OzGkFObjrnlzVeQMOCeTSTsuKBksjsQQTg==
X-Received: by 2002:adf:a41b:0:b0:42b:47ef:1d59 with SMTP id ffacd0b85a97d-42b47ef221bmr2063764f8f.4.1762887282987;
        Tue, 11 Nov 2025 10:54:42 -0800 (PST)
Received: from osama ([197.46.148.47])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4776bcd51dfsm271008845e9.5.2025.11.11.10.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 10:54:42 -0800 (PST)
Date: Tue, 11 Nov 2025 20:54:39 +0200
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oupton@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: add missing newline to sysreg init log
Message-ID: <aROGOivTetFI01S_@osama>
References: <20251110211051.814728-1-osama.abdelkader@gmail.com>
 <86346kvr00.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86346kvr00.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_105445_175466_19048A86 
X-CRM114-Status: GOOD (  21.72  )
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

On Tue, Nov 11, 2025 at 09:49:03AM +0000, Marc Zyngier wrote:
> On Mon, 10 Nov 2025 21:10:51 +0000,
> Osama Abdelkader <osama.abdelkader@gmail.com> wrote:
> > 
> > missing newline so the  message is merged with follow-on logs
> > the change only affects console output formatting, no behavioral impact.
> > 
> > Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
> > ---
> >  arch/arm64/kvm/arm.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> > index 870953b4a8a7..156cd1a6106e 100644
> > --- a/arch/arm64/kvm/arm.c
> > +++ b/arch/arm64/kvm/arm.c
> > @@ -2845,7 +2845,7 @@ static __init int kvm_arm_init(void)
> >  
> >  	err = kvm_sys_reg_table_init();
> >  	if (err) {
> > -		kvm_info("Error initializing system register tables");
> > +		kvm_info("Error initializing system register tables\n");
> >  		return err;
> >  	}
> >  
> 
> Given that everything in kvm_sys_reg_table_init() already screams
> badly when it fails, I don't see the point of an additional message,
> and I'd rather remove it.
> 
> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

Thanks Marc. I just sent the patch to drop that message.

Thank you,
Osama

