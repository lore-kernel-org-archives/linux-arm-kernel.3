Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E4AFF8868
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 15:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OnpbmYP+E5sjgzH6AGREzKKSS//r7A74prqftlk3Nj8=; b=oHRAYzzjvydWxtZzPK2yL/bPdT
	p9MWxknW+WTFQx/PuWqXRmlvYpBhygI/54adYlqMvCIEWkI4kLADQCv2ZYuGJTdghdnwrBrj6G5GR
	Qh6WnB92RBpbYtyK5Zpt8tyrjwQXyEKzVzy5ki+up9i/p/Uzfw7LTNnld6U6+WD94QILMZk7gAAA6
	sOe5gVKWX3j9SmqHFf4HW5efo5EU9N5uzEqflFLb9mlCukpUQSKgKj9RjnSbUKFV2R0UGshFxQCYo
	DFvptqrWzlte5r7sfln6dkDls8tsxmSPeget3k/Tw+MW4VTs++nzxIv6RFMjVG6KpDXagV+8siv9r
	vnM3KG0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHNa6-0000000HANU-1B4U;
	Mon, 27 Apr 2026 15:09:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHNa2-0000000HAMp-3fKc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 15:09:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777302539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OnpbmYP+E5sjgzH6AGREzKKSS//r7A74prqftlk3Nj8=;
	b=DSIVhk5yR0j/zPxlg6MI2VUIv9bioP9TS6nFLd9jK5A6X9BDWtQ+Vp+Q5+SW9KT9qJvPKP
	urrA5JARaBvLJGcmywom0ltvXZU+eZbJmmlNA907qu6my2zZHDQn/hINIASyEgV/ndAkLz
	N4cYlh5ZKjRWXvp6pjMGWeXeKzWspQQ=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-374-Gj5HnUapPcuzk9pJA7_RsQ-1; Mon, 27 Apr 2026 11:08:57 -0400
X-MC-Unique: Gj5HnUapPcuzk9pJA7_RsQ-1
X-Mimecast-MFC-AGG-ID: Gj5HnUapPcuzk9pJA7_RsQ_1777302537
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8ead5ab474bso1584767185a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 08:08:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777302537; x=1777907337;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OnpbmYP+E5sjgzH6AGREzKKSS//r7A74prqftlk3Nj8=;
        b=blltR0yaCtN5Mxb0WFlCIOLZbpOu/FV0P5TCgWDcQN6wL2Wj4xfk3BR/2hHsQLCoLa
         sVRZn1GRYq+IJRrWlRGnqtX6JNnuABysabxDWv/3gd47tAag7+udfIYk8+aA/DdGPyeE
         HgqJRqzfrr4LRtcleI3b7xejY/P4hCeGAKLxBLYyZ7sX2s20SjnwfXfrhdYokAK6tdXa
         xuPuDg2nX8NSb+mqFL9xpbuf6UQSRwZNmZRyLGZawoXYBxOJb5/jg+2g52cORz8Db40s
         7fCYMo5e9GYgKiJ6NfOhNHijWfnWEmBWm6ZRvahpLIg9V71DeFrHXippnS0sVXa48TD/
         gw9Q==
X-Forwarded-Encrypted: i=1; AFNElJ9h+pUVB5lMFfVWbgN4lnGQ6nRiXAO+EdsuZt0M9ng87lKis+BfnVlCdPxAdNY43xYDufEtEPycF5HwLE8T9bOJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxF95PyhQMLkvQlWfe0juwnH8ZNZVJ1finHCb+cGsweYCYKJCO8
	x+hvi0QRJzMJwk8b6ns5I4th/1pTU1MHL8O5ccDJJZ88ANrXWrxVzBiFjXroJLsLRmEk9ZnBwHy
	VsJmZBHbSODCawpTmR0obr8b+Qt+QUfW6eFwY7GKuAJ6xbva/DloIZaghuA2cShrFKy/KX29VBn
	LB
X-Gm-Gg: AeBDietLp8FboOqD0X8/pTqO29YsJGForKEIDdoC1ZJI9NNezkt0jFmObEcOKbxZH6k
	dbSzJevZPsjK8tEp/miDv1dt8g8meFJHstn1adMndvmw0A+mERxDDKn9QMelL2KE4rKimC+Rr4h
	Fij6+KlY6bVks+ZFWO6NeWXD1HF8HcIEoCT73AQv5tuuoezPma2rgpMY5YOW42j7b4SW4WNSLJ7
	6ZfCF6VYn3Ze017SSrmMP3Npa4l0TLcpHQx0rjhpQeN4+pMyVlfu4VKtxjQ95u9GhRn1egTR8WW
	6smJGFCS6iqgBdMR2rNTCy3BWQQALtGlKTmS4Aqizo4syEPGRq0TFlXJbmuogwiEBsXkjpZNWdO
	5W/JDSdirVd1Ovr0FzXkwGqItbPTPGANXkY4CE3vd3I78IVYmh129Y3lrs3ZqO2YWS7o=
X-Received: by 2002:a05:620a:4402:b0:8f2:4470:4796 with SMTP id af79cd13be357-8f244704843mr2109709285a.20.1777302537033;
        Mon, 27 Apr 2026 08:08:57 -0700 (PDT)
X-Received: by 2002:a05:620a:4402:b0:8f2:4470:4796 with SMTP id af79cd13be357-8f244704843mr2109700085a.20.1777302536186;
        Mon, 27 Apr 2026 08:08:56 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8e7d98c15a9sm3012370985a.43.2026.04.27.08.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 08:08:55 -0700 (PDT)
Date: Mon, 27 Apr 2026 11:08:53 -0400
From: Brian Masney <bmasney@redhat.com>
To: "Thomas Richard (TI)" <thomas.richard@bootlin.com>
Cc: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	richard.genoud@bootlin.com, Udit Kumar <u-kumar1@ti.com>,
	Abhash Kumar <a-kumar2@ti.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, Dhruva Gole <d-gole@ti.com>,
	Kendall Willis <k-willis@ti.com>
Subject: Re: [PATCH v6 3/4] clk: keystone: sci-clk: add restore_context()
 operation
Message-ID: <ae98BRZXD8jzFjgv@redhat.com>
References: <20260427-ti-sci-jacinto-s2r-restore-irq-v6-0-72c6468cb2ab@bootlin.com>
 <20260427-ti-sci-jacinto-s2r-restore-irq-v6-3-72c6468cb2ab@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20260427-ti-sci-jacinto-s2r-restore-irq-v6-3-72c6468cb2ab@bootlin.com>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -0VosSwYXQBq_94slRmXxJpFDjMzvq1vseOb-yIK3a4_1777302537
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_080903_298824_B76F19A0 
X-CRM114-Status: GOOD (  11.65  )
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

On Mon, Apr 27, 2026 at 02:21:36PM +0200, Thomas Richard (TI) wrote:
> Implement the restore_context() operation to restore the clock rate and the
> clock parent state. The clock rate is saved in sci_clk struct during
> set_rate() and recalc_rate() operations. The parent index is saved in
> sci_clk struct during set_parent() operation. During clock registration,
> the core retrieves each clock’s parent using get_parent() operation to
> ensure the internal clock tree reflects the actual hardware state,
> including any configurations made by the bootloader. So we also save the
> parent index in get_parent().
> 
> Reviewed-by: Dhruva Gole <d-gole@ti.com>
> Reviewed-by: Kendall Willis <k-willis@ti.com>
> Signed-off-by: Thomas Richard (TI) <thomas.richard@bootlin.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


