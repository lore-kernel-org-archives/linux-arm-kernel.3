Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75991C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 16:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mx2bivaT9nHj/TUUekmKHf7Mi+OS/7gBxKis+Uo212E=; b=gSoXzFvwASe8zdLhmcfZMnwGq2
	rPCQnu9JUcPPjLS41KSNT7Cz747ZF4SOAT+tfW10Myq8F540ziuat7AQ1VHrx0zHsQdYe2oIIwCWG
	exrabyQe4WixSrfNhhFeGzGCRKs4jGV7HHcZVhkBp6RgD9Ttf8tKHyBpssCNv8kcawveHZ9sb6I6k
	pe7R7KXx6tEY0XEoM0gOJ6stIe6Ut8jiWfIQgQg66qRqMSjA980yUjyRaU/ZpEtXFm0/PGmixbF6v
	5ncIHuMmEtiUj1kiESPvuy+zzRY/JxlLQC0Nw8+3/QjKZMBPasnN8vSZhkwiKo5mSECKWf16rsDMl
	/bb8N0Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2AQr-00000000BWH-39Br;
	Thu, 03 Sep 2026 16:36:57 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2AQp-00000000BVs-1Y4Z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 16:36:56 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-396750cfee6so2220677a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 09:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788453413; x=1789058213; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mx2bivaT9nHj/TUUekmKHf7Mi+OS/7gBxKis+Uo212E=;
        b=YBguYL0wV/PgPUZK9JRh2qi029+OfQGkg+f6cSP0gg8MqPV2PaBtUZeS/7R9tE6y9T
         a6sSZINtIVgIQ6ugddLAPmB/tjcZhe2M9D/vBbdA7BnhkvFl1YfHsG/Wg0f1nNOzEQTo
         rKcQ8lSlg8PpHHkQlkPEZ2VZ3fKSqv9LE4c/341a/1i0RyALGw64f58FbKq0bi8djZRp
         pAL6MPqAD7EhU5m/+f5wELpjACldn+RqiY37duSgCPgjBqCOSp6f18PY05zH7gHtwTNu
         O1BWmve6sU3HSMn7SEZXVv0Gsy6GlTkGrZT4xC18TyjYb9ur2+f0l9XOsMNFrZH6iL6D
         FEOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788453413; x=1789058213;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mx2bivaT9nHj/TUUekmKHf7Mi+OS/7gBxKis+Uo212E=;
        b=LCtbcLJc6v7z3Fx9YtNbjOSTlhkU3+ftmJWeZ/6PcwlTAA7qfNEdFL+1oVWG/9sgtY
         Mh96KH3ZdnVL8f737nSkT9kCcCP2DpejRS4pvMO+J8QVl9XXHy3gmNy+IrHwYsdW7hdE
         BvlLicFOFvKpJiRacN9z3WSYZERLsi0KIea4il+1xqSVoywRgRrMH73HcIAstgymD7Wm
         6VUu6uyA8mMFR3m42IVsyW7S4a+acsY6S522aez8GyHWmAnQ8tqAfQsrvcLEqgc4tZmI
         aLUqeErFWvomm2ro74cD7tulIqCO4/WtET+u+PCV1VfHFiy8yS7hamNKEcEfZpPfrNwW
         YhwQ==
X-Forwarded-Encrypted: i=1; AKwUvBys54sncTBrCTqwdMvgb3eb0SOUb4GxgTrDq7awe5bw3MwN5Zmbe8tHrFRg3X8DrLMsGkzQyYpTdeyadqUmzCv3@lists.infradead.org
X-Gm-Message-State: AFuF++kntz06muLzRYXT0pYu7jIGxnZzI5q3cTzXEFk41wNY2BvaNgTp
	v6QRY5wTDDyPJt36mTSBzy3jKBNWDA3Lnl6BLnzpqUaBbxBC/zRkVFwX
X-Gm-Gg: AYBFou2XXt6JQcMW/qRKkd6+CeLoGZdIbTTpIfZhpuo0rYvfW2gEzggmvOOqUu0tMNp
	ZKeoRYs8KNMzlgwvWjxqVKZVJ34UHtdDpK50pggpEjTooU2DVZmrSSLeQP7vSXTDxJJBqkZZPlX
	8bS6IdGpj9LwcPTNYR3NviI+iN6biKq9FKfaz8njV0u95QuVGdk5jk+1KtMcA6XaFmDsOZtx8Em
	9VZHK9JIAN4Z0Tnos1vbXNKG5V795IW7uNnDAtjucBFMxAIUt3ecWL1eaALhaFh1ezIiueMuBOL
	fauRWHufVyW0oJ+3Ri4i4C1NkROgeycVQz80zvWwFMH5xgiL03KelE89pyoZD7WEcNwjoj5n2RP
	dgupK+X50DSUXk6reJExgShODZCY57Svs/krf1kO9MwO09ZBdA11dbwFitPtv9mcE7gdL95QkzJ
	K/TqkkiY0YgdfAnpTO4qxvdVdNNZhDHRM668UMkG0lJmrqWw+eYQDI1cV5t29Ht5ns4Qg=
X-Received: by 2002:a17:90b:2d83:b0:38f:5801:dc0e with SMTP id 98e67ed59e1d1-39aee049464mr22342206a91.15.1788453413101;
        Thu, 03 Sep 2026 09:36:53 -0700 (PDT)
Received: from leonardoc-nb ([179.160.36.119])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b8f44d7sm115281eec.22.2026.09.03.09.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 09:36:52 -0700 (PDT)
Date: Thu, 3 Sep 2026 13:36:47 -0300
From: Leonardo Costa <leoreis.costa@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Leonardo Costa <leonardo.costa@toradex.com>
Subject: Re: [PATCH 6/6] arm64: dts: freescale: imx8mp-verdin: Add Mezzanine
 with Toradex Display 10.1" LVDS V2
Message-ID: <tu5f2ffhfe4vxw2mmdz5qy7svu5a2wi4on3ixrx7zn66chnim2@3tb2jnwp5eke>
References: <20260813133335.1941580-1-leoreis.costa@gmail.com>
 <20260813133335.1941580-7-leoreis.costa@gmail.com>
 <an3brO5COdw_F76m@SMW015318>
 <rglymw6p4c65yoqz3pjn6e6nq7cil2fa7m7dqghshgdpavby7d@kyza3ceavq6z>
 <an3tiDOUUYLb8PAq@SMW015318>
 <juuc4af7ndbajcl7gzf4tg5qz2q2j5tt3rvql4jbauradujrre@gc5nbdhhixaf>
 <aoSqJ7pHEgJ_RZmr@SMW015318>
 <gsihg6tzkrq6gcygquzbjtiqntvoxp67lo6mqntnmbyvyw7s3y@suv4t26pl5eh>
 <aoW7M1CmaPWDxvhE@SMW015318>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aoW7M1CmaPWDxvhE@SMW015318>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_093655_410399_8F7FD138 
X-CRM114-Status: GOOD (  31.41  )
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

On Wed, Aug 19, 2026 at 09:18:27AM -0500, Frank Li wrote:
> On Wed, Aug 19, 2026 at 08:56:53AM -0300, Leonardo Costa wrote:
> > On Tue, Aug 18, 2026 at 01:53:27PM -0500, Frank Li wrote:
> > > On Tue, Aug 18, 2026 at 03:08:33PM -0300, Leonardo Costa wrote:
> > > > It seems that the drivers are being deferred at boot start by the
> > > > device_links_check_suppliers() function. It runs through the drivers before
> > > > they're initialized and defers them if their suppliers are not available. The
> > > > GPIO and PWM drivers are able to follow the gpio-map and pwm-map properties
> > > > (through the of_parse_phandle_with_args_map() function), but from what I see,
> > > > device_links_check_suppliers() has no such mechanism. It follows the phandle to
> > > > the nexus connector node only, and since there's no compatible driver for it,
> > > > the function defers the consumer drivers used in the overlay.
> > > >
> > > > I think this is what is happening mainly because setting the
> > > > fw_devlink=permissive kernel parameter (which sets the DL_FLAG_SYNC_STATE_ONLY
> > > > flag) solved the issue, though I could be misunderstanding something.
> > > >
> > > > 	int device_links_check_suppliers(struct device *dev)
> > > > 	{
> > > > 		...
> > > > 		list_for_each_entry(link, &dev->links.suppliers, c_node) {
> > > > 			...
> > > >
> > > > 			if (link->status != DL_STATE_AVAILABLE &&
> > > > 			    !device_link_test(link, DL_FLAG_SYNC_STATE_ONLY)) {
> > > >
> > > > 				...
> > > > 				device_links_missing_supplier(dev);
> > > > 				ret = dev_err_probe(dev, -EPROBE_DEFER,
> > > > 						    "supplier %s not ready\n", dev_name(link->supplier));
> > > > 				break;
> > > > 			}
> > > > 			WRITE_ONCE(link->status, DL_STATE_CONSUMER_PROBE);
> > > > 		}
> > > > 		...
> > > > 	}
> > > >
> > > > Has this behavior been observed before? Do you know of any work being done that
> > > > addresses this?
> > >
> > > Does a dummy container driver (for debug) to proof your analyer?  Let
> > > me to find time to debug it.
> > >
> > > Frank
> >
> > I made a dummy driver matching that compatible string, and yes, it did
> > solve the issue.
> 
> Thank you very much. Let me think how to fix this problem. Nexus node
> should be direction overall.
> 
> Frank

Hi Frank,

FYI, this patch sent as an RFC addresses and solves this issue:

Link: https://lore.kernel.org/all/20260902-fw-devlink-nexus-ready-v1-0-68fe1996e78a@toradex.com/T/#t

In the meantime, could we have these overlays merged as they are right now, and
refactor them to use the nexus connectors later, when that patch is more
concretely established? We'd like to be able to have these overlays on upstream,
but we're not sure how long it'll be until that patch is mature enough to be
accepted and merged.

Leonardo

