Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D758AC02181
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 16:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zmh3LjgDXuCrewk1sEnTYAx0gKWpB7//JCbiu/mkB5g=; b=pwvqHAGrwzCRzN79hIi0kDtcMv
	pkwWx4zS1vKA85j1l8OmE5usZ6Qvs0312tvRrdPfBUEc7HeJDmysJYLLwj2CeYFZBiUDmNmY5mvDc
	wlEUNfXfdx/yZP2YSCLmbdlSsvqgZrTFAS+Tzr3tqUQDl6gUw37+f224Cndtm5/mo0t2DtqtQ6vf1
	Tgq+bjOLfmuvapaSw0ETb0jwAogolx0v70fHaJz1zhMyROOwojFo13JGgW97H4vS8T0NdMHnQf87b
	Ww//WKlzoP6Wj+7fipOSd6KTGOvA9JK6CDUDwMrv/xqO303JcIrQI7Xqq6h2i9gGVkQVUyIYSZRpb
	Dl61Q6yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZv7E-000000064Mn-3RNi;
	Mon, 20 Jan 2025 16:59:08 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZv5t-0000000649k-2Xfx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jan 2025 16:57:46 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-38789e5b6a7so2647600f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jan 2025 08:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737392264; x=1737997064; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zmh3LjgDXuCrewk1sEnTYAx0gKWpB7//JCbiu/mkB5g=;
        b=GE/98F2yzoPTTSmR1bXzzBzusFdMU1kB89fYIUg/1tym1gqF2GGBZ0pw4dAwHSnTyc
         U1JEiwcjGqzZjkhA2iqOxMnnA5fx3i1S4ux+Ogi9ku33qfAOLmV+A2BmmXzewna++dqJ
         PC8+hJJ7Hdyo+JZC66FAsECN6P5DrXS65ojMMQYqd7ubPIAzhfPBo2WINaH9+BIyr1Jw
         QltKmhz23p+Nf6CE72EugbYi+rg049nkbJfMZG1NFDDXevS8AX3UzI417Vlvzn3GSVXf
         6CchtalSwg9AAuLFKc6KhbmHipFvDJpNk97F2mF+70wdGvAz4LhozPbaxu77qkcDKVKL
         qcmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737392264; x=1737997064;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zmh3LjgDXuCrewk1sEnTYAx0gKWpB7//JCbiu/mkB5g=;
        b=q57NA6oSP2RGZ+gBDbqKPNSHWGvjs7TAmN7Ex51qpx8/N+DQP7C/gsDY8DdTCgEILe
         +6AZPwUwZhGoesHuaBCtgV9lWPe7QemNBn2LbNLiHh/s7hu0RvFysy85S0zR6712c53A
         P1/4kFeSV0oy+MqD6G+8uRPorVa1V4L9UPRTHFp/IiFDuFxbRIv78FjBO6Bv2fXgmlTE
         QXgF7D/UyCn6o/JZBCZqEg34RAfJrk+gQyHVoyOJ1tINArJrtflrbyjNRr3rYPjExGs3
         BD9iUmlKH1pBeHpH6HdBJafoeOI5t+RMdQRw2wvZ+SCEAO2pAgNt7VMIpNEsBLerhPiX
         5QOw==
X-Forwarded-Encrypted: i=1; AJvYcCVqe3GoBNN+jycHdDYjtxpnDabW91wDYJpXJV72BVgDsSvR/Z4XK+EUQGwt362dKHy1XshCC9lHTEuEEe7Z8gV8@lists.infradead.org
X-Gm-Message-State: AOJu0YzT8wRcDGyzCmDqjyjuhsRieJlKWu+8Sv3xIWh+fUhqCbZKJT2T
	/ZcnpcqZqoJWC2h1ARelkHWZa5cyHLquAHtmINatSD7cfo+3s3vN
X-Gm-Gg: ASbGnctZXv1kxOytblzy1tgxHSfz/uhOAONnqvr+IT9Jdd0ipWcMwkGzOmuQpsF22N/
	GbYMCG72eqQ5JO4RubjFURewGP4DnizE2DiffzUQqOAqC/1ABSE2a9ULjJD+1aoDYJpDPqvPYC7
	WlqaY8fXQmL+1mxN8255/nNX5oVSiPpFXNS7WJ+Tby7v0lgiaNmaDBxxUhs+QegVBthlYRelEPL
	WzXaycOjU3w1mixFWrnmoMyYh+e530nuitpRF/IlXxl91VfGgT4Awjiksfe4I3Rv2uDyQ==
X-Google-Smtp-Source: AGHT+IGKu75VIea+1l0gG8qAVWHWQ1vof/as9Ss0ZtV+hV3fly0gKZ/gd8EVS7Mq9SG8yWFL+kGiqQ==
X-Received: by 2002:a5d:6c65:0:b0:38a:888c:676f with SMTP id ffacd0b85a97d-38bf565f13bmr14009180f8f.15.1737392263729;
        Mon, 20 Jan 2025 08:57:43 -0800 (PST)
Received: from eichest-laptop ([2a02:168:af72:0:cc96:d269:5cab:960d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3214c5csm10978409f8f.8.2025.01.20.08.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 08:57:43 -0800 (PST)
Date: Mon, 20 Jan 2025 17:57:41 +0100
From: Stefan Eichenberger <eichest@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: andrew@lunn.ch, gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com, shivamurthy.shastri@linutronix.de,
	anna-maria@linutronix.de, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] irqchip/irq-mvebu-icu: Fix irq_set_type for sei and
 nsr
Message-ID: <Z46AhYi3DN4TtBKM@eichest-laptop>
References: <20241217111623.92625-1-eichest@gmail.com>
 <87frlkcx2b.ffs@tglx>
 <Z4k-DkMt8XQYs_kf@eichest-laptop>
 <87tt9ya2qy.ffs@tglx>
 <Z4qbioby2DK2Dddl@eichest-laptop>
 <87cyghan60.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87cyghan60.ffs@tglx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_085745_647181_5622A740 
X-CRM114-Status: GOOD (  28.12  )
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

On Mon, Jan 20, 2025 at 09:45:43AM +0100, Thomas Gleixner wrote:
> On Fri, Jan 17 2025 at 19:03, Stefan Eichenberger wrote:
> > It seems that irq_chip_set_type_parent is not failing. By adding some
> > debug messages to kernel/irq/manage.c I found that irqd_get_trigger_type
> > returns IRQF_TRIGGER_RISING even though it should return
> > IRQF_TRIGGER_HIGH according to the device tree. Maybe this was fixed
> > between 6.10 and 6.12 but I need to analyze that again in more detail.
> 
> The trigger type is fixed up in mvebu_icu_irq_domain_translate(), but
> that should be the same with the new code in mvebu_icu_translate().
> 
> Can you instrument mvebu_icu_translate() and validate that it is
> 
>     1) Invoked at all
> 
>     2) The type fixup is done:
> 
>        if (msi_data->subset_data->icu_group == ICU_GRP_SEI)
>               *type = IRQ_TYPE_EDGE_RISING;

Thanks a lot for pointing me in the right direction. I think I found
what is going on. My instrumentation showed that we still end up in that
function but the translation does not work. I think the reason is that
the msi_data conversion is wrong. The following patch would solve the
issue:

diff --git a/drivers/irqchip/irq-mvebu-icu.c b/drivers/irqchip/irq-mvebu-icu.c
index b337f6c05f18..4eebed39880a 100644
--- a/drivers/irqchip/irq-mvebu-icu.c
+++ b/drivers/irqchip/irq-mvebu-icu.c
@@ -68,7 +68,8 @@ static int mvebu_icu_translate(struct irq_domain *d, struct irq_fwspec *fwspec,
                               unsigned long *hwirq, unsigned int *type)
 {
        unsigned int param_count = static_branch_unlikely(&legacy_bindings) ? 3 : 2;
-       struct mvebu_icu_msi_data *msi_data = d->host_data;
+       struct msi_domain_info *info = d->host_data;
+       struct mvebu_icu_msi_data *msi_data = info->chip_data;
        struct mvebu_icu *icu = msi_data->icu;

        /* Check the count of the parameters in dt */

Do you agree with that fix? If so I will prepare a proper patch.

Thanks for your help, regards,
Stefan

