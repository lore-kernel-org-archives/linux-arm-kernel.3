Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C73BC44520
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 11:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8IQ4rZYCXmoKGNhUGfrKCmINcJDQqtVyHwlnRNnG6X4=; b=xmLEUe8UVodcgikVpWiwWMQoSF
	iY1NjqDdZGx5BVfpdIFQU9NoOcO2S5ddhR16QlVZbFr9SlmIr7HX0cSOTo5IvqQ9gE89xMp5NfEPC
	wjpe989RU6W3Z4bCvl8kdpOJ7WLuIdWkE/QP/ECNOIaP3X0ZffMQwYXwWhW2Y6tAJVJvejjhPlZQY
	xSQWGaN22ZQ6NBGLtboDuE0mMWiKD7P1Kiv21gCFr2kq3COLJzlxBecGbb2yAD5ZaTPLRZzAS188b
	vu/TIBS2trN3U41KFzQpVgqAl7ijtityg+aYoMm5MMJ6eDGNICvTrJkrA1aspV1v6umUQy5i6OGqF
	zblMKuBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkh7u-00000002C4u-0N31;
	Fri, 17 Jul 2026 11:53:10 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkh7r-00000002C4S-2Ewr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 11:53:08 +0000
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-6a116bd18ebso2361464eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 04:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784289186; x=1784893986; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8IQ4rZYCXmoKGNhUGfrKCmINcJDQqtVyHwlnRNnG6X4=;
        b=PZdq85QqYwQdZHqGB7m34T3iz/8C48BKOGffctAU/AkGuMZYv8DUGBbPkhWKqS+cNO
         tlgbDcA1rG/IRktHzLD6bcMYqgQc+9Fw3ll/rsVFz+Zl1JY7n7fRs95j69D7n7Gz5KH4
         UXoLn9z9SO4L5wqGia5kvQXmrhOCq+Ax15tWWxStZqvaJoi+TUh6MCYUjnmdo8+QU5u4
         BxPMPzrCePm28YW1oBWXXQAALVUaldcJFT12Co3D1dbaFRoqhU9PXo0R92LO2GBWeU7d
         mG5NTsabb96uxOoEVC9UIIoDaqTrDJKhV3MoBzdDdFeJm4tZkQmzvoXqTteEbeuz4iFe
         SyMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784289186; x=1784893986;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8IQ4rZYCXmoKGNhUGfrKCmINcJDQqtVyHwlnRNnG6X4=;
        b=W8TfqUFRTtXbrDsRxa2lupyFCNCcf27L7uqb8r0GcNfeuKoGDX4ANbs5pt9VW6bLAd
         kl1GR5GYPlYODHfHBMxKH6qY2HMx9V7DYOlYUE5+ChXDS7NPodtsoI1AF2sPKlst8Ckm
         wIAJR708LsmCJ6VdkJAKxwvCBRVBfBI0aVM0oFiZo00xEuVUCFmHMDHff+DA5JTlJZ9V
         qf2eM5khbor18xInyTA4lS2J3vw+KxvY8J4vpMYuFGrePjsNyktzI7lcBfTR2oGKqL0a
         dg2OWX0zUIcUGfX2Z3pzcirxxKJlPO5B1V1LclWZePoCPUu5aoEUne2r6UQn/U4GKWsY
         1dXQ==
X-Forwarded-Encrypted: i=1; AHgh+RoyIBtCFWuxkjbv0NbPqPxc6/tzzsur2Ugq0U2VRF9wDwhqtKJFsgQSASuL/xH0EbPsLUvpi51jNAr+3VxDeHjg@lists.infradead.org
X-Gm-Message-State: AOJu0Yzf7EBTXKipBHXZjq0TnlLYEJb2yyijFJpjoG4aBe0OmDdVNn5o
	Vrpmza+4v1Za10lOqdQI1o15+OazJwHwrK1u06MKixyyVLeENDcCd1hS
X-Gm-Gg: AfdE7cmLXb1bjTNvSjXZGRSykOdiuUJuOiYIa87n5B2AQz337f7eFLmY/cMqewiWIjq
	SpD5tatwAj5AbRFb654+1zOXj5v7uM8VypXw9lU7lK9Y1vbPN1AR50XilFMocwo6AAseuMbkvKe
	4ffn75EwoUxWNg0fx5fq4cat5KmHZqKR8A0xg6sn8/N44/ER9Fi2Jr86vlczTxqcRh78Ffi/3jG
	eWogEllAW1XsES5KEFSlGDvLX/ty6+lpPlId1IsN9YzPaBOdkhtr/6SZGKIxc1njTb9IkPHQp5e
	0wDO+uCIjL1wmx6bfjfv6KHfwU0btQbzbsh6X/wImvhVG5jpgY4aQ898OVTfgKNfEBdujtlLER2
	A55S0CL7OjusOfJZBmcrEnH58MAxc8pfeJZmgE1Ae1+e4a2WAtcrWoL8O1Ae25sfCvuNgnA==
X-Received: by 2002:a05:6820:1621:b0:6a1:805b:5288 with SMTP id 006d021491bc7-6a53688627amr895125eaf.33.1784289186437;
        Fri, 17 Jul 2026 04:53:06 -0700 (PDT)
Received: from localhost ([74.80.182.90])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a516bb70c0sm1151776eaf.3.2026.07.17.04.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 04:53:04 -0700 (PDT)
Date: Fri, 17 Jul 2026 14:52:58 +0300
From: Dan Carpenter <error27@gmail.com>
To: "Luke Wang (OSS)" <ziniu.wang_1@oss.nxp.com>
Cc: "adrian.hunter@intel.com" <adrian.hunter@intel.com>,
	"ulfh@kernel.org" <ulfh@kernel.org>,
	Bough Chen <haibo.chen@nxp.com>, Frank Li <frank.li@nxp.com>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	dl-S32 <S32@nxp.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"harshit.m.mogalapalli@oracle.com" <harshit.m.mogalapalli@oracle.com>
Subject: Re: [PATCH v7 8/8] mmc: sdhci-esdhc-imx: fix resume error handling
Message-ID: <aloXmhWN5QsqNcxM@stanley.mountain>
References: <20260715071818.272318-1-ziniu.wang_1@oss.nxp.com>
 <20260715071818.272318-9-ziniu.wang_1@oss.nxp.com>
 <aln_pFNqL8495Y_a@stanley.mountain>
 <AM7PR04MB6870A9E6138EC8F7C8B23E53EDC62@AM7PR04MB6870.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM7PR04MB6870A9E6138EC8F7C8B23E53EDC62@AM7PR04MB6870.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_045307_574191_56808042 
X-CRM114-Status: UNSURE (   8.23  )
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

Oh, heh.  I missed the entire point of the patch...  It should have
just been:

	ret = pm_runtime_force_resume(dev);
+	if (ret)
+		return ret;

Another way to silence the Sashiko warning about missing cleanup if
mmc_gpio_set_cd_wake() failed would be to add a comment.

	ret = mmc_gpio_set_cd_wake(host->mmc, false);
	if (ret) {
		/* Just leak. It's fine. This path is impossible in 2026. */
		return ret;
	}

The other change was unrelated.

regards,
dan carpenter


