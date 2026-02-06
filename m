Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2314EE20A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 13:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=LCL1DbowgJz3KhWgEdjSYavXvn767FPhfGqyYV8f3No=; b=uVwkk3ykp5pL/U
	03oDN+8/rNCwbAUEAKzVLXJjTUIJUCAEyD3gC7whw3J7jX8bkNeEHqfA0mvMWv3/sCx2Im3E8GmqB
	LwQpBL07a/LEoQHr1uBXZu2cnNcrk2N5rE8WL5mKBEoxr++Zgttt5OxdpMZX8QCvSb/vLTucb67hN
	TWxFR8sD1Re9IRpsNaIaUzJJ+mBs+rAkNt54tX5yCyWi4I5mjQxGp9ZOSBknEPiZ9IV7hL5B3c5JL
	YCYBHs3uC1QXCZQsalgbyjrQvr9S1rqwOau6WM29qc5DlUtW/Rd4iB7P842FzC5jhPcNaBWIxGo7+
	uk4gGDGeJn33BlCP+kvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voM5R-0000000BNfn-2qwW;
	Fri, 06 Feb 2026 13:41:29 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voM5O-0000000BNe9-3iCn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 13:41:28 +0000
Received: by mail-wr1-x442.google.com with SMTP id ffacd0b85a97d-43624d7256bso1251813f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Feb 2026 05:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770385285; x=1770990085; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LCL1DbowgJz3KhWgEdjSYavXvn767FPhfGqyYV8f3No=;
        b=Ni6Xv+rsQVtfn6dygkXcDxZOrUto0dhQWCzhdG8oJI8lb7MBmFY3Mxs41DhNG9TeTK
         fy9W+/4j/S6auU7kzwmqGaEOnCvJtNbjm1GyjnJ6FRa+pqvlaBoNUWFagj5uQjX0Nk9e
         ekBHZs+vQnT9OPjJ5G49b2CfDjVh6Rq6sZv4bRwg+LpEjFAuZKq5BeT2MBCTzXiw4Wpc
         jZV6YfO0OMyJZwhkeZu2uq33oUuwYq6jCjlz7mDW4oeyR885K70UnrjZnGPoleReWbJv
         j56+T5yuSdcW83zOxRJ0QuWbNmsCVrvJe8yh04V3MhBzbxrJnUseqxjwrLJ0HbGOflW/
         ONbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770385285; x=1770990085;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LCL1DbowgJz3KhWgEdjSYavXvn767FPhfGqyYV8f3No=;
        b=je+ZGQsT6qteJbcmNyL60UhG4O/k3Vm7yZkeBCiPmaudcmGsyHL6J+EnUhDiqyUbG+
         XFB6sMwTSUYIFOd1x+GZqjbT3dHR2jZZLP1nn82w5w16Kc796Ckb//9R2tT4/AxDqsMT
         NiiMAFq9E7KT6E2q3oHhHlgRes4TVPgUe3tDbP4nnyJD+Dsa8ClFeIiRC7gKQT58hAMI
         qM3FcOXTODh1aUbXgaRbSExkzHueL6uC7Y5OIi9ZBxZXuJBy5TXTkxco45PmwJfraV0r
         v01iWOe+RNZHmeYG0zBUWmdjHGmN2WgxDbdDLCv2Y/fZx2UqokX8lYBcTordHgK4EQgt
         ibWw==
X-Gm-Message-State: AOJu0YxXNk80fDn5EhMAAK/D9t79H3bw5V2vJY+yLmFdRMZBP33bQlB8
	NM9ACVRwtxxAzAq7Z2D+0zVw3KYjM6xcWxJ0KoeKM7qYXgAlUOtgEm+4/2UDPdAJeTs=
X-Gm-Gg: AZuq6aIEKg0/f8gTA/5liZycTlD/bhBIj8mzD+/eiMCFRYIzCaEBMoX2RR7YG6S0q19
	Lv5XOoVUqTql3tTIpZuKC5sTs5cnebmIv7KDySObX6+bQvguOaE+siM0mt/XSMLpPoDM/W7Lg4C
	P0bHvC7+DUeTYNq1F1183ZYnLzHaPdO3YWtY/AoxlXoNKE7YXvak8RM/8+EfoblaNHCE/hHnAUv
	xe1LvkDp9a4aGkIjPYg37nfWksM6lugkabddezaMpAPoRH6tGcDR7nKeKGwXqJy1ozfS/h88d5C
	r2yeNzBRp0kA+QYlQ+2VvqoxQ5NlR5pwY6rsSa2y6m/pcyh15uFwSkoDeu6ig69+uGBVsmXD8Oe
	DDv5nhbUSGj9BqKMXLhiIi5dHaPhaYeXFqQ0ExAPo6WmAO5eAW7YbluSua4NsQ8H/dZgf9rXl4l
	fkNgPMUu2QSE8h9khg
X-Received: by 2002:a05:6000:240e:b0:431:752:671e with SMTP id ffacd0b85a97d-436293422d4mr4829014f8f.15.1770385284981;
        Fri, 06 Feb 2026 05:41:24 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43629730992sm5455993f8f.21.2026.02.06.05.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 05:41:24 -0800 (PST)
Date: Fri, 6 Feb 2026 16:41:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: [bug report] soc: rockchip: grf: Support multiple grf to be handled
Message-ID: <aYXvgTcUJWQL2can@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <caa37f28-a2e8-4e0a-a9ce-a365ce805e4b@stanley.mountain>
X-Bad-Reply: In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_054126_930646_3767D449 
X-CRM114-Status: UNSURE (   9.18  )
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

[ Smatch checking is paused while we raise funding.  #SadFace
  https://lore.kernel.org/all/aTaiGSbWZ9DJaGo7@stanley.mountain/ -dan ]

Hello Shawn Lin,

Commit 75fb63ae0312 ("soc: rockchip: grf: Support multiple grf to be
handled") from Jan 16, 2026 (linux-next), leads to the following
Smatch static checker warning:

	drivers/soc/rockchip/grf.c:249 rockchip_grf_init()
	warn: inconsistent refcounting 'np->kobj.kref.refcount.refs.counter':

drivers/soc/rockchip/grf.c
   212  static int __init rockchip_grf_init(void)
   213  {
   214          const struct rockchip_grf_info *grf_info;
   215          const struct of_device_id *match;
   216          struct device_node *np;
   217          struct regmap *grf;
   218          int ret, i;
   219  
   220          for_each_matching_node_and_match(np, rockchip_grf_dt_match, &match) {
   221                  if (!of_device_is_available(np))
   222                          continue;
   223                  if (!match || !match->data) {
   224                          pr_err("%s: missing grf data\n", __func__);
   225                          of_node_put(np);
   226                          return -EINVAL;
   227                  }
   228  
   229                  grf_info = match->data;
   230  
   231                  grf = syscon_node_to_regmap(np);
   232                  if (IS_ERR(grf)) {
   233                          pr_err("%s: could not get grf syscon\n", __func__);
   234                          return PTR_ERR(grf);

Missing of_node_put(np) before returning.

   235                  }
   236  
   237                  for (i = 0; i < grf_info->num_values; i++) {
   238                          const struct rockchip_grf_value *val = &grf_info->values[i];
   239  
   240                          pr_debug("%s: adjusting %s in %#6x to %#10x\n", __func__,
   241                                  val->desc, val->reg, val->val);
   242                          ret = regmap_write(grf, val->reg, val->val);
   243                          if (ret < 0)
   244                                  pr_err("%s: write to %#6x failed with %d\n",
   245                                          __func__, val->reg, ret);
   246                  }
   247          }
   248  
   249          return 0;
   250  }

regards,
dan carpenter

