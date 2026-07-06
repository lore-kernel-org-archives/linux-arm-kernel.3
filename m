Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20EABC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 15:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/lpTu6aBahDmOXbfz6cfxVmcBkiFNtxLGTXawIRGXSc=; b=I7Bv/ZoqIyv30TjCgM/LND3vAg
	otBl3alEYKF7XwJEKSa15++xfPxPrF05LSfiDEicEAW5HE7F55IWWeEw2ovlMwb8eG9/+CtWrDBPE
	FjR9Mqigc+ej0pjS61sLaOM5X82NIWU0cIi39pTe8gn3Xa/CIT90Il8FtT6w3twbPJNbUUeIEJ5jZ
	EPt0vDetY2yHy02cS2xcAy5C34neBaD7tIjO1uO7/dmE3XZ0MnQWhggKIRTDrzaKoL267n+nA3PQ7
	qMN5sdtC923MN/DXfpVlub5UbbBDGwORSnJuOWdaWEPaXZMV7G3g1AabNDCqWve6TyeNzHDNRUxzy
	ITeay4cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wglNC-0000000CuML-2TKb;
	Mon, 06 Jul 2026 15:36:42 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wglN6-0000000CuIy-0JSg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 15:36:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783352195;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/lpTu6aBahDmOXbfz6cfxVmcBkiFNtxLGTXawIRGXSc=;
	b=BpVS7mjd7MZNvg7JMi2XZH9Af+0F0PKMKZaoNlToXPFX37asZGu869XTDswO4r6Lgh6u5+
	oJ5zQEMpgVt+yihwpQg+5Chf3+HpdjquXVRqbJmWVxHg3v1xzaB8CLLljKOpv4BlZ7MkA+
	2oX3emNoypkxg2Fn4+wKW0SKj4qSyOI=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-570-8ii32oU3PNiJXffTFCSomQ-1; Mon, 06 Jul 2026 11:36:33 -0400
X-MC-Unique: 8ii32oU3PNiJXffTFCSomQ-1
X-Mimecast-MFC-AGG-ID: 8ii32oU3PNiJXffTFCSomQ_1783352193
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-81bee860fb7so3966487b3.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 08:36:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783352193; x=1783956993;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/lpTu6aBahDmOXbfz6cfxVmcBkiFNtxLGTXawIRGXSc=;
        b=juSgTsT2+wxW9yUeLzv0VTA2llw0dAbI2i8Crk6FIkvl/Zu6gIaGZO22y44z4blY1Q
         v4QxsarrvN8fPABGTvkfNiRY3b8GVypgf+ir+svZMzFrs7mmn9o3YpWQPJjMCwfQcdYd
         qMSjCH+c41rumIV1/TP1KMha7f0pzjUMRh4MeEUP2ZWdsrq3HWO6JMngMQHylZnrVyYB
         Msvv+VYIe3UhkTkquo9u3mgmOen+lpxCedzImW23ZiHv9MPFtViT6RcMzgF+9CBrheFx
         MfR/ctym0v075PVUwUwbBO0vGbO6rmNLDw47HGd7uWmeQHvWQPijIAx2B5QS2CTb+Er3
         cxqg==
X-Forwarded-Encrypted: i=1; AHgh+Rp0WryUuJsMFF6p3ZLTTQ/D55C3ulmPr6rDKX6SSESxMoLgjMea1q7FRw6SOOvu3lwd09KTXEEwyPaqjzvSTLEm@lists.infradead.org
X-Gm-Message-State: AOJu0YxDz1/aHZIA9arWwKytJpMUENTWvEVPNbPYnBlHREP4gA7y2Tz/
	x6DxEhkBHFC7RM5pHD3BHhCxmby6AY/Ze1WKrlONwWbDNwYJYYs90hMZcMxTkk8vAsAV2zyH9Km
	+x3XgG/C5UBCwou4rbh2c2rdN30uC3JnPqxVE9lnRYF8KUzHv7SPS0lws/MyXrEEt0D3pfjc74m
	g8
X-Gm-Gg: AfdE7cnTzPQ77pRx6yQLDOSwPQILbiZ0OJr+dUClkA/Jtl2RQ3UeQLNKU5sQ93nZ/Ba
	ufhAaePZG8Gwo9h5P1NZafNTEqXWMY+diHwxYr/MNSz23DVVYbjywDCpDuhZhqoLR7i/iXUQulM
	veeg82/71TD1ALAGJmXE74lHIYVB5wdikL8RW94b46IqSFW14kD3VdzLYfEDJle3sOOomZqqa4c
	OSU0ZmXkRS6NpQXYkOvg74ZMCHrBYYrSSVQKShA0v35Vxrcpt3RoHTRCqlTfrU+TKe2HIch6ipP
	srcerCD3tRXE329rDzI4hrYSTAoJsKVoCUO26rpYe0ZiNthvmI/nCAe959Fj8m+IXjZVQM4m8xp
	zbq7kl/tqAFDcTLLrLWZGMgVbC4edAIqaBBEr5cZ07iFu6Q==
X-Received: by 2002:a05:690c:660c:b0:7dc:7764:3e83 with SMTP id 00721157ae682-81be153e0d2mr6745537b3.17.1783352193178;
        Mon, 06 Jul 2026 08:36:33 -0700 (PDT)
X-Received: by 2002:a05:690c:660c:b0:7dc:7764:3e83 with SMTP id 00721157ae682-81be153e0d2mr6745247b3.17.1783352192647;
        Mon, 06 Jul 2026 08:36:32 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8144840568esm59088637b3.17.2026.07.06.08.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:36:31 -0700 (PDT)
Date: Mon, 6 Jul 2026 11:36:30 -0400
From: Brian Masney <bmasney@redhat.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: imx: imx8qxp: add missing MODULE_DEVICE_TABLE()
Message-ID: <akvLfrL2TkhEnxbQ@redhat.com>
References: <20260705001705.70400-1-pengpeng@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <20260705001705.70400-1-pengpeng@iscas.ac.cn>
User-Agent: Mutt/2.3.2 (2026-04-26)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: i3WWy71OdnU_XRZxuPRLLLYmbq1yd8U2uir4AykHAUE_1783352193
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_083636_186159_A428F986 
X-CRM114-Status: GOOD (  13.33  )
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

On Sun, Jul 05, 2026 at 08:17:05AM +0800, Pengpeng Hou wrote:
> The driver has a match table for the of bus wired into its driver
> structure, but the table is not exported with MODULE_DEVICE_TABLE().
> 
> Add the missing MODULE_DEVICE_TABLE() entry so module alias information
> is generated for automatic module loading.
> 
> This is a source-level fix.  It does not claim dynamic hardware
> reproduction; the evidence is the driver-owned match table, its use by
> the driver registration structure, and the missing module alias
> publication.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Reviewed-by: Brian Masney <bmasney@redhat.com>


