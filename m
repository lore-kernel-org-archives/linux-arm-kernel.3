Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0419FCD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 11:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8TcYVumjXtOCP5kzdiYOwgOj5Y9zDw6OkE9mWprckgc=; b=Ugqlbc7/E7QGqkXidyxRb1oW7k
	6dJutZhnly2sW89y2H65C2P9j20T8z4xDoDkC40vme0mVPNQuakL+XsignFlw3mMTeHLq4EfIbhAe
	w8g9vT2cwUlWv7Jrs07p0vs7TDMMplQm4h9eIYRm6zU9Pq8vGNjKPoSVf/iZAmexM1fHf6P2bJegh
	4g0R2xDfaPF2w+3fOq0Ccjow1J+EaQRnOenmUhfpVvbnvJmmfKEQgYPB/fYP6oK9687JUVdSVQSEZ
	jaSTxLv9P7rajIKd4lkSjRwsEehmFjW9nyLdBS6UsRDxxC4u8AfJBpZaZFJoADNOLh0lng9QOkKzU
	jjftm03w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZo1Y-0000000HCHI-2ELk;
	Wed, 17 Jun 2026 11:01:36 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZo1V-0000000HCGq-4Bff
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 11:01:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781694092;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8TcYVumjXtOCP5kzdiYOwgOj5Y9zDw6OkE9mWprckgc=;
	b=Zwl2o2+fA21tSB16cgwDlgh5ebBMkY7mhJELBqAG7MU9xtbkZECoNwW9HDyQE6LFj7sY1S
	Ttd0lJA5g2Ux5G+2iwFHajnMfbf5L2+gwxGXZsK42Wq7BC3WIZg2aX6WxwQ0GsMvKuDmXh
	aJI0jZiT7XImnpYvmjgnvB3aDjRBDko=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-17-WElWVbgnNGe86yHDVS6yTw-1; Wed, 17 Jun 2026 07:01:30 -0400
X-MC-Unique: WElWVbgnNGe86yHDVS6yTw-1
X-Mimecast-MFC-AGG-ID: WElWVbgnNGe86yHDVS6yTw_1781694090
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8cce2b4c290so106253476d6.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 04:01:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781694090; x=1782298890;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8TcYVumjXtOCP5kzdiYOwgOj5Y9zDw6OkE9mWprckgc=;
        b=WygaDZuJygI/YW5OyQKjK9sihkZntutgfbR0SD5v6TzEtV4jt2roQ/HWjLF6wjWzQJ
         j+CYr+kaoOWgMX6kyT2xHUO/bcw+FcGWKCjliplUJF2F+GFeW33qgN/Y5F/jcehB/yCg
         LXYVJqrD39vJ3h9iIhT1XW0GepyJ7YR0Hswt7ToM63Ft/zu7iFPZB+hwNqF3jmizH2ZU
         Gf5tEMauRpnVUwHjGHIcPG59SWop+cG+T8oi35s/Vncndb6YFkMQflb6Zu+rxi1PFjCa
         O8+h9PZ11gWzbmlEDwFMnI93Uh2FhdaIHKNaMSbbniv9ikpPGwcN/rfR16gIXbP6PkCI
         htdA==
X-Forwarded-Encrypted: i=1; AFNElJ/eTYdbSUU6unHotNopNqC1TYzrfsZIqJNknIq8IjfP3WVczjBqaKdAUCvTG9XNPu4RVn1NwSlXVagZzAfFrm9/@lists.infradead.org
X-Gm-Message-State: AOJu0YyylWFaHEO4/In1s2s78chtzXuwZqLf+EmL63ejeAgZqMYlMpZX
	Ft3LT2HHeAXey/GMgmFyYCN/JPn4u++P3EaaMIi7SekYeOOvI60Hg/yJeYr0nEoWJksQv7vb5K3
	QgHOwoUsowCJyNRy7B+M3BnHgK1gwwd1fh0DHtDofYhL2FHyob/hYI+U90oGDdEXYxwfSzu8PVK
	Fx
X-Gm-Gg: Acq92OGvnkqMUKqI1FfQddNgkBT1X7J7czRsudVd+5EOvQKg4ZIJxMcLSatJZrf+p/t
	ec/hbs1YMh5XcMO4YMvskmMyD8VhBCgXC6IIzdwF2n7ypxYDtnqckXVd0CAgfFOmLpp6SlLi/gI
	TRxipSsYP+Sb/lIs9jRkujSuLguo43dUQCYxuwcVXrYY1jZz9D/QHKid//W3oQNdNb0Gg03zNrY
	3NlD8R7P95RolI1Xko26nyIHSXs96X0b6VTnXTGNVioa9e3LTu8ld8GgB2dYJBb6MJhZSl0yYFJ
	PHapgtADy9gpihYwAP8yI2pD1Q11t8kZfuqR7XLKfuioqh4VCBAhUQ8CxjMcUJsv03uwuZapZNn
	hU/7BwhqGTowel3HN0ai8xkkudQqBHSzPX7c2pwPPm5L2Bg==
X-Received: by 2002:a05:620a:7103:b0:915:d10e:8c4c with SMTP id af79cd13be357-91d8dcabb5emr574006185a.42.1781694077437;
        Wed, 17 Jun 2026 04:01:17 -0700 (PDT)
X-Received: by 2002:a05:620a:7103:b0:915:d10e:8c4c with SMTP id af79cd13be357-91d8dcabb5emr573733385a.42.1781694058081;
        Wed, 17 Jun 2026 04:00:58 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-91619f1c851sm1732803285a.16.2026.06.17.04.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 04:00:57 -0700 (PDT)
Date: Wed, 17 Jun 2026 07:00:55 -0400
From: Brian Masney <bmasney@redhat.com>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: andrew@lunn.ch, gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com, mturquette@baylibre.com,
	sboyd@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] clk: mvebu: ap-cpu: fix missing clk_put() in
 ap_cpu_clock_probe()
Message-ID: <ajJ-Z2ooI_Wd9J4a@redhat.com>
References: <20260617014126.1716291-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <20260617014126.1716291-1-vulab@iscas.ac.cn>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aOP4ip0rZNd9w0eAtekL-YMcbjdVom88R82SvZNELfw_1781694090
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_040134_127929_3C9FF1B8 
X-CRM114-Status: GOOD (  13.09  )
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

On Wed, Jun 17, 2026 at 01:41:26AM +0000, Wentao Liang wrote:
> The function ap_cpu_clock_probe() calls of_clk_get() to obtain a
> reference to the parent clock for each CPU cluster, but it never
> releases it with clk_put().  The returned clk is used only to read
> the parent's name via __clk_get_name(), and the reference is leaked
> on every successful cluster initialization as well as on the error
> path when devm_clk_hw_register() fails.
> 
> Rather than adding clk_put() calls, replace the of_clk_get() +
> __clk_get_name() pattern with of_clk_get_parent_name(), which is
> the intended API for this use case and handles the reference
> counting internally.  This matches the pattern already used by the
> sibling drivers clk-cpu.c and clk-corediv.c.
> 
> Fixes: f756e362d9384 ("clk: mvebu: add CPU clock driver for Armada 7K/8K")
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Reviewed-by: Brian Masney <bmasney@redhat.com>

For the future, if someone leaves a tag like Reviewed-by, or Tested-by,
then include it with your next version, unless something major changes
with the code. Don't post another version since Stephen's automation
will pick up my tag when he merges this.

Brian


