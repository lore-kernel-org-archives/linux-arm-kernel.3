Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E5DECCFA1E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 08:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2PM3V5SUOmIRwUEw+SelsziXLyJorncDb0vBfck6mjc=; b=dJNwfB75B6XAMrHwRgwgRMjpbz
	AKldUqbMJSHfcsxOlj1eP+unjvLRxUXQKUB9wPEV6ELHInMI6eEivnJTs4owtWm+cOJefSKQyX9Ut
	HNeB1WiJFN8QwcJmc70IrlFJOOMkC5W6HkOfTLcy45iPv9LjW22JpwuzwBZ+e73RfBwX0JG2y5zZZ
	WuvHujag8pUambcbuOUDKkUhkIX0GjgqcwUOMdPrcxc08AySMYYU23tItxWKI1pzWvklBEvcoQ6KO
	wrcQ31yBHW3/bhjTPZIfe5C28CAoqqA3YK65f9NHRfxUDgA/4Zw/vrl4bhmBqUwJYGfTUW1on0Dhe
	CUGL7JAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ6gq-00000008PsR-2QgA;
	Wed, 12 Nov 2025 08:58:58 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ6gn-00000008Prd-3nzw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 08:58:55 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-477619f8ae5so3990635e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 00:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762937932; x=1763542732; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2PM3V5SUOmIRwUEw+SelsziXLyJorncDb0vBfck6mjc=;
        b=cw3PBSjB5XPmp4Nr8qmcN1VqkVLg/5ulhvHx8UAGdTaz+w6qBs0tWbUthaGn4GES7A
         L3UhyzQb1xlXVZWcp8nGWg/FK81XjDLuFPyqrg5dn28rwHINMp8S3VS7xu6ML0s4sMtB
         Ihm7Wjb9RqJbldo4gTYtRldfvC+/rdQKmMERaareW94I1QT3Gyh/nMJzy/lN4fcKfrxh
         mrHRA5tMeDzFm3qcsEV0jIEX6tenlJYhW65xrJIHKK1zPBQDzI0O8a9WrHij3q523fNO
         +h0HVnZxd8pH0pOnGAx3e4baxmoasWAX9zsuUe0p9NOPpLBXEX+//lyIzI6jbL7Jw/M/
         C00g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762937932; x=1763542732;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2PM3V5SUOmIRwUEw+SelsziXLyJorncDb0vBfck6mjc=;
        b=TT95tRooYJwFnKYLrAU4GAPXyYE/j50tWzf1wY40vsqPU8A5g0+PfvUlk+5+nau7ez
         lNwR2MrMD+bunD/kkCR1ZVhcbofSKo08fzBy0qXBlHzCHBSdsrwj9Ql1A4TNXMq/B+77
         AZm1UH55vqTgYTGh/VutMe8wNhL6YR7AXb5rcGhUF8ZhStB0sN5FpGYs9U581/uGWhAe
         iJVA8dAzEtcRhsVunt20ENhCSfS4IcyaHuwGkGjKYwghAxikLxhVG/vBbPcUsAOMwL7U
         JrNcGUjEXXCPiQryPactQsIi3MbyZld3cDyvZnBUx0K/lUauhLyFLU2Ohdh9LSUnNf3n
         vAeA==
X-Forwarded-Encrypted: i=1; AJvYcCWdaGxxtFL93BQNCcqZghF+CclsFkXL1njE1dnbmpjbpki6syLMhg8SQlu4BV8zWoBAxDiBwpLgNpS+5v+M0h1n@lists.infradead.org
X-Gm-Message-State: AOJu0YyRKJUyKbaxHX79MtKNqOlpu8eKnC2Tt7DP/6Kg/8dtyauKbji3
	6bq9OlP4AurOX7yb/SgOehYO5ivRQJtHFIeNqEuOm40VKUKlLQZrv1+Wh0h7Gp4zi5U=
X-Gm-Gg: ASbGncttzIyXqUn5UwaFVJx0FvMdld9SDIWopo5FUa0ydx5sye6n0ybHRRtSKEs1pYz
	KSUPTjFmHzGI0QD7u8E7rztWpgAoGQi/M6cHGl6QSo5xKHemR2yrd44vqnQ+1/ZlNYFIH2B/I2M
	/iegiQXEASi9o+jOU/HpHG/TRhAuq8Qev6GQAyPlYS7tjgj57fcpdxvtHnKaRDi51GmdiqTKhsk
	dMrnUqogSY1RfnkYuqeboPo7qYvZXLvGVfVl6yCm9OAkw8o5W3gkU8QPmFyhM3xj2zu5hoyxNEa
	++H9eHrUMGJYoaOh67juj10kPRG1fRELbhBPCZbENWgr8Xi7f07F5RkWpRD5ZNSAO0po6WDJcAN
	2+ACcbNFHC5YIWjemOcUcpGQlFI65Zv1yQ6gJ6soOi7s20JTNIPFwRcGMd2VhRWe7trsN63OB
X-Google-Smtp-Source: AGHT+IGGVYvDUcqcUiPZLSUtoqDWfq0dWOAgjoDY5T7sj0q34JOuNXmckY/tBFbuwEb7ShY09sMSJg==
X-Received: by 2002:a05:600c:4703:b0:46e:506b:20c5 with SMTP id 5b1f17b1804b1-47787086800mr14036335e9.26.1762937932076;
        Wed, 12 Nov 2025 00:58:52 -0800 (PST)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e48853sm23640245e9.6.2025.11.12.00.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 00:58:51 -0800 (PST)
Date: Wed, 12 Nov 2025 10:58:49 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: abelvesa@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, peng.fan@nxp.com, kernel@pengutronix.de, 
	festevam@gmail.com, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: imx: imx95-blk-ctl: Fix clock leak in error paths
Message-ID: <y6ospgarjnretdsankhgtudttqqjfhltjyt2u6hnejgeufbkcb@yhk7ejuexvr5>
References: <20251111114123.2075-1-vulab@iscas.ac.cn>
 <20251112023025.793-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112023025.793-1-vulab@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_005853_956349_DA479FE0 
X-CRM114-Status: GOOD (  11.81  )
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

On 25-11-12 10:30:25, Haotian Zhang wrote:
> The probe function enables bc->clk_apb early but fails to disable it
> when bc_data is NULL or clk_hw_data allocation fails. The cleanup
> path also misses pm_runtime_put_sync() when rpm is enabled.
> 
> Switch to devm_clk_get_enabled() to automatically manage the clock
> resource. Add pm_runtime_put_sync() in cleanup path when rpm
> is enabled.
> 
> Fixes: 5224b189462f ("clk: imx: add i.MX95 BLK CTL clk driver")
> Suggested-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>

Next time, please do not send the new version as a reply to the old one.

Everything else LGTM:

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

