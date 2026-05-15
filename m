Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6986DCD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 10:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cGJn8Hnu9Cg2hyA+NdzLMHOmCSnkgp4MbF/B53wnZOM=; b=MJSAV0PWy0bk0UJds+8HmFbkvZ
	U3VXVckYJfnnp9r1FexFFoUH27vpMoukYlpnPWKoeUkRKhmf/+TfVPazdRO4f8EaLXb/Bq1WQ9jgR
	jWrGPydnO0AoiGGYEx+zOYx0gseW0FDRqVm8O3id09MpVLGIW1pdHL/WdX5cj7USo0/hiqNE+7Mwm
	Qvs7DGzmJn9IseXiPUPhO5rSLzD4x96ENmDxBnyEtOc7AxTW4Lllews393Dr6PBowR0D2oBEjNoc+
	UcpiyLb69ry7Ej4K0zNjjRWattFczRELiQwFf8xW0gZzLWmV5fwrq29x0TgZuLf0ORyie0pEAPH4M
	6/z5MfHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNpmO-000000082ka-3WJX;
	Fri, 15 May 2026 10:28:28 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNpmL-000000082jS-324i
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 10:28:26 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-43d77f6092eso5625534f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 03:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778840903; x=1779445703; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cGJn8Hnu9Cg2hyA+NdzLMHOmCSnkgp4MbF/B53wnZOM=;
        b=XVG88WjzqjRN0LNSDVKHOp5ADMalvVzn1Xs+YpojePkp3pwYMMAEsPBjdeswf7y+Xh
         XQOyHtxJg6O5aiLNzFlk1Tb0qZu4Vjf1fT0vPWbF39TeoXHp5a5ln2hQXlGzTYxOf8yB
         w5hU0LKSF1NIYLQWbWGIqloEIbYkKZYoijeFgRxB/mNOC2gzvW14iurT9ukllQl1xTPD
         NskRSYuTJJs+TpLZl+2UNfZ4yIaQNblma9ibXcxOvnEroWTO4RCn1bIKIjF+BLyU7vMw
         VuLkEupDJvF6Gd6XEUqKez3TKTqTejpnueTbrcKsdApMR5a+e/9NpDC4CaaOupIHY8Zf
         Lk5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778840903; x=1779445703;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cGJn8Hnu9Cg2hyA+NdzLMHOmCSnkgp4MbF/B53wnZOM=;
        b=eX7+1SxedkmaRb7Z9vYHTgS+pHxSjm+8ASPhbRUWMRpcmh8IB9U+PqlOaFSZpEC6uw
         jkvz4oKe/YXyIUxMjdQ9Cd+BWACRdM7loV++kkPv93HN59+01VDNktBX0KusVsmOVoLI
         D22aNEQXzwEau1BgRq1M54He/rcnw7Rp3JjIiAk8UzmEcUJK0toWn2b2l+7ZW/162wr5
         No9L65sWZUuT9CMT1TEh9rLaJe7bKQ2tJCMbZ1HM28MsxJB1l7jJsixnw7t3J3MgkkVo
         Rj3wJDDwp6PAQ9TqULyrwZdNwVLCzeZaYhjfhKTkDr+MxnOUc0KdCS6xdz7msoE0KDkC
         jr0Q==
X-Forwarded-Encrypted: i=1; AFNElJ+FLeR6Gc30kgSXEW5m4kHNnYNfEVVXB1tE9Z/peQpLkDkTLA3ZgCdwyECVfFxUnaQeTZrYJXjmfPrBDX/D4mWw@lists.infradead.org
X-Gm-Message-State: AOJu0Yyq/NYHbzid+Xm/X8ZN6decZoRYW1rSsDY8y+k6hRX5eWOBJNlH
	+zqD1YzIWK38jZ0nKhejsUPFWiSn+NGWPaIyDHPYS83AX2IKgdH8b6vN
X-Gm-Gg: Acq92OF7VJtlcTFRm15gCGO2oWZ7Rt8V7d0ffdI5TnPETfAirnsrS+tJuNRlJ+Yj44R
	SxdhPlVezI3ZYXBBOmhVr/WeK3FEJ2tr/HgzMN2FN5kIq1lSkZ0Iy9VIKmNIXvO+DAJvkUnDNt8
	aiXPI2uGTrM6qsi8zwdJoPoU7N0U9Appa2XpXJoqY8VyAAy8xyG71vzziWNFT/+MCF9hNnIZHhX
	pxRyn0eyD4ZXtIdvERXPGADS3VtekIfWGfM1pOdzXkufecJnmmcHohzvKCmC6VAjbY2OOUBstnL
	Tt0ge9cDlBTRkXMKDno86BiPNPV/cRo12lj6ZM8+O1rfKY+zhMhA97eEcmeUKGzEb1krcvpgqzj
	dttK8WECUMHhd0EgTlkcjcaYu3r3FIVsMp3q/bH19H66YKD/UTbYffMiii0TDAuFu/Asb6gyMnZ
	0mVlQnLs1hY2oztEMoH4A=
X-Received: by 2002:a05:6000:288c:b0:43d:761d:5423 with SMTP id ffacd0b85a97d-45e5c5af599mr4592584f8f.16.1778840903228;
        Fri, 15 May 2026 03:28:23 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e768c4fsm13718499f8f.8.2026.05.15.03.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 03:28:22 -0700 (PDT)
Date: Fri, 15 May 2026 13:28:19 +0300
From: Dan Carpenter <error27@gmail.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: Fix OOB in scmi_power_name_get()
Message-ID: <agb1Q6mrGyDwFdmO@stanley.mountain>
References: <75caae28bdffb55199a0bc6cac5df112a966c608.1778838987.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <75caae28bdffb55199a0bc6cac5df112a966c608.1778838987.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_032825_769522_2785E65A 
X-CRM114-Status: GOOD (  11.25  )
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

On Fri, May 15, 2026 at 11:59:15AM +0200, Geert Uytterhoeven wrote:
> scmi_power_name_get() does not validate the domain number passed by the
> external caller, which may lead to an out-of-bounds access.
> 

Is an external caller an out of tree caller?  So far as I can see this
is only called by scmi_pm_domain_probe().

	scmi_pd->name = power_ops->name_get(ph, i);

where i < num_domains.

regards,
dan carpenter


