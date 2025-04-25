Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B336DC369D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 13:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=19SQnt4bgMlzflhUBdgnvIZw2qMd2olVK4+5/MXutG8=; b=16sytl1Qsl/z7lNeNaJVzPz60u
	8BYspONB/pHzRyWMCN0zwHGf/VII00NTfATuxRl+ctkmFBsY7CI41S9KDLSBofCglvM76fgBIjCWC
	y7kJBaQN9bGDnniiZ0olBhb27s0CMsohOhksDV+iBgF65Qg2Bn9lhrdzzILnAgrFhga6UTGla0lSh
	u2wTEAKYv1PpGgzkaR5tpExHK036aaVb9G0XohWIlNzi/Nk7EEIuf/bK6qQEE541NTonkj6vuaF06
	mbWq52HlAUOAJ+gwhDxNHZs07nfCD8MUQzNLGiYaoyeDTmJhSCdEgHRYAi2XqZuUoA4C1V0OOx2Ff
	TtzsbR4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8JTu-0000000HLtD-1pbU;
	Fri, 25 Apr 2025 13:52:42 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8IWP-0000000HAwe-1wvD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 12:51:14 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-aca99fc253bso330993266b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 05:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745585472; x=1746190272; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=19SQnt4bgMlzflhUBdgnvIZw2qMd2olVK4+5/MXutG8=;
        b=KIH8LyrPtAKj7nvlZpRCecHHLPMWukGZ8AnMKSImO5+VC3P2QNtWU1FXeDd9RZOlnb
         jKn59fGeIpSzrK6OQm/dMxhSnajwYTa3So12Skt28fNqmKuYvDsGVhJ+q+7R7k4n+1hF
         6sd+knD+gj2VdN4NF7m0CqBkYOGhuhHRyvoha8j9lG31Vzo0y0xR4nD2qwVpSFtSzXqQ
         0YqiM67Aha9pwBHAw3Kw/lVPZM3HJ7yDakgu5jZJxsUQg2NUErbTZVDW1af5ciV1uc+4
         CzJrznXLtAhmr8ii5mtxQYKjSM+4oAOJcvXJyMs4kybLk3ceUUGpi+a6Uu5TjUtqVE24
         XWhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745585472; x=1746190272;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=19SQnt4bgMlzflhUBdgnvIZw2qMd2olVK4+5/MXutG8=;
        b=KqvqdWTmd/d6XyP7WK13XoXedFBygwsEXIg2A/wBy/mrbBYwx0glF2Ra4oYidvMehq
         6Z3jEHO51sSMoJ9R2z+cmSljFzy11aQcEo8uPbzwAbO2yanJDUKHtOQNJl3XIBkdxTMX
         HNCGgrTdGQC6p/K66a8muRDpmrltErGeqJ6jD38aWw1Tc7sU5+cB/irB/x8a0WQ3VKvb
         4v27Y0B8gxSMg5NNZWMP6HzVqthfAj1hjD3roDVi+ktwpMofs3TGboO8LwdcFxa1Ex9C
         b+2GDQfBgh2vO2TDCeT0jApGDanPQ9G31Y1FMfVIscwJkRDci6Y9+pSX5sBtAWL55Wh5
         fBXA==
X-Forwarded-Encrypted: i=1; AJvYcCWMXccyMs1pDw7EJwBGUhrViGFRUXZ/NpmttGojrpHPausuqfHnlxo97WIpFb4c6s6cKTfG8zhJ9cKUm/fpgoGn@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6r3acQiTr2pfTa2ZCYIN2w8aZfTOth3oPl69GH5jTU03t/Mxt
	B7SlozF/AqB8xTeOBXidPMeqxfvoXTjzjuUAD036fiePdn0Odnlz
X-Gm-Gg: ASbGncv8nmsQUfp70EQzBQ4kn2v9pdghr5ZUeUSkx4foX7tjIc7/KBBknvEEGiD+xUy
	KYmN+NmdPSw0NOkBdjHb6HBttr/CEsGjZaMkpICsC7WYZUt7aIekYCS+wDXg5kTPXQZmLIOQbyM
	69E/3MbtSmk5fNufEoV3SPpciwkuFzRvK7nOf370pm70YSy5S38JXqEAQZR0TktCZQrWMstt94M
	KHHv1QTqkm/jEonQoE9OrVCMD24goBXcH0Y3ldqSOIUwIqeh2ojSDqMd6osyP+p6X7McB8nidc9
	stbvhPznNhe6qurKdGfmbVC4AYWn8zINJeIiq2K4aIDIVwPIQm+38HNzw1Zp6BIZxg==
X-Google-Smtp-Source: AGHT+IH/NrWffoy/u2nsOLxymoZYRZ+CZhi9kKY0D1DpYpA2UcXxmclpaKgPo2+5Qdo1fcEv82aORg==
X-Received: by 2002:a17:907:781:b0:aca:cad6:458e with SMTP id a640c23a62f3a-ace713c2584mr182471466b.43.1745585471276;
        Fri, 25 Apr 2025 05:51:11 -0700 (PDT)
Received: from localhost ([217.151.144.138])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ace6e4f8835sm136631966b.67.2025.04.25.05.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 05:51:10 -0700 (PDT)
Date: Fri, 25 Apr 2025 14:50:10 +0200
From: Oliver Graute <oliver.graute@gmail.com>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: fsl,scu-wdt: Document imx8qm
Message-ID: <aAuFApCnKVqKA1Zu@graute-macos>
References: <20250407-imx8qm-watchdog-v1-0-20c219b15fd2@bootlin.com>
 <20250407-imx8qm-watchdog-v1-1-20c219b15fd2@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-imx8qm-watchdog-v1-1-20c219b15fd2@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_055113_502668_DD72547A 
X-CRM114-Status: UNSURE (   8.18  )
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

On 07/04/25, Thomas Richard wrote:
> Add an entry for 'fsl,imx8qm-sc-wdt' as imx8qm also contains the SCU
> watchdog block.
> 
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

Acked-by: Oliver Graute <oliver.graute@kococonnector.com>

