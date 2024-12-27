Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57685E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 12:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UEnUZO9THp2QmJQH4wK4+VQx1HvXZnRH5UGZIBC6hS0=; b=NXWVZRu0cBrkq1bD+Dl3V0j5Qc
	RVqbQD/V4dHVPDNzhuAmpeiWkRlwF/UubyzrI+5pnbe0WVxdBJoHAH2rnY92+uYgWLLtD094LfJpT
	bHBfUf9e7z24j3/XON2RomoEb/43Y/xc+X6gVsagZlLM2T7zaTaD2E44AXrHjBKiEC6syjwidGsY2
	Es0oX7mBAz5EGPKC09lTTz2BK5/tiFRKqs4KLNZeBKWciYf0r+BiZFxWxjFkto1ZWMN9zdsi9GANv
	FlwAbqE9ypRaeku6eiXz/KQpXZrm9p9qGc2U3Qimu6FbwfoWlyZjCNGAf8e0Ad3dFGg/y//n/KvM6
	NcCHTPzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tR9nH-00000000CYL-2vwk;
	Fri, 27 Dec 2024 12:50:19 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tR9jy-00000000CAI-33n8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Dec 2024 12:46:55 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-436202dd7f6so81992995e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Dec 2024 04:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735303613; x=1735908413; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UEnUZO9THp2QmJQH4wK4+VQx1HvXZnRH5UGZIBC6hS0=;
        b=Vw3ioUmFRzMVn0bZ0wkQPCQqZw3MCb26HTs+Mzc+KqWfQzR7Wv2KARmAz85Lb0fjc+
         /4T4B3EWRx/rSLXVudxNV3nh9QsSzN9wujHq+lLEc30UvYVrX/z1ih1txYfUQ2mHu7mQ
         4uHMvdOK5rscy79KYGNB92enDgmB9bfmKH65lgo/1PtQcbtCEwjkHGX6DiqLUgyrNVLN
         bMrKXKaFw7LKYoVDTVdcFTmkiTi/oqD+7cOFGsLIrSDWj0+SdcjNkb+NPN7w6qMZ/Zrf
         1mh4hGILR3quDs7qga5U0BKK6u3ldlMYeIUqZRdYlGRyFuAMEkNri22407NGuaOA2tKw
         2AEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735303613; x=1735908413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UEnUZO9THp2QmJQH4wK4+VQx1HvXZnRH5UGZIBC6hS0=;
        b=SAJ1EuNaL5T+apSPMqM+sSNhl67MgRuk0WS8TyShmZozz7HHLtIU3D12NEsDWtTAoc
         SJfA6dapScUgFQstSVow15bogH207wSW23IPUfEbPurV7TlagUALsuMLXTGaSNq3WLnZ
         opbtUrZ/B9lUQgs04doWnDAHGLZLk/8TVph9UgIdUk33cstLpAI84hMbxvQML1E3WprZ
         rai8A9b7zciIWmlDruoBgQOEBs3gwI4/IZZLOVRNX8ooylrEe3cvAnGYKhy6dSQLc9Fd
         8+2IhzKi2EtgLNPfiPAuzaFa1WCj6FczSHQ+E3WIEANBk1sk+4rMF+qd3e9e25Gm7hnS
         B3vw==
X-Forwarded-Encrypted: i=1; AJvYcCVFq6jGMxbYDiQEbEhk5gXFBz4rduIKnIhzfXFvxInrOf4LmL//QCPDKaPvCXzd+IeR3ZK3NXTGA1SJUkUfnJcm@lists.infradead.org
X-Gm-Message-State: AOJu0YwjNcDnH9n55GMaRRTsKKuiYkSVrI1C2sHn+aDuTBMcinLErO80
	0oy72CJq71iby+LFuNDLDZrddKqwnRNg4sma7KkEXRxB1chsoIdRskUOmvNFK70=
X-Gm-Gg: ASbGncuid2/HDSwh8Hf5EZnQ4lDzuQuVgxSqrw0uy9ukXL3hFc9bqpo+Z5E7sPLQqQ7
	BKgtj+YCL0lOcQW/NwE6H5R7cRQ12aGWWOGUKB+5i129RcrOt4ktM2yxZHwrH6eIrNWDvxJnxdC
	8VS4OBbxoG1U1JbYZstDwYv543tgXJ6Lk8Z3dZzeJrVcH/qK2pmW6nisViasEkVfaM59HoyaZKg
	hUklWJXMINNi1Ii/pbf8VIs/yM73NIiefUyzngv0n/1zi01nAIsySnd
X-Google-Smtp-Source: AGHT+IGQZ8FD/ZdXOaKiLcZYnvRp9y+mIdk15+UQCdfKpIMmCj7iHw3rYG0INhv1ebbbbwyJxTknkA==
X-Received: by 2002:a05:600c:468f:b0:434:a815:2b5d with SMTP id 5b1f17b1804b1-43668b785ddmr206211385e9.24.1735303612885;
        Fri, 27 Dec 2024 04:46:52 -0800 (PST)
Received: from hackbox.lan ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b11495sm297172905e9.19.2024.12.27.04.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 04:46:52 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengfei Li <pengfei.li_1@nxp.com>,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: Re: [PATCH V2] clk: imx: Apply some clks only for i.MX93
Date: Fri, 27 Dec 2024 14:46:01 +0200
Message-Id: <173530350113.4140483.13428387054202142135.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241225001443.883131-1-peng.fan@oss.nxp.com>
References: <20241225001443.883131-1-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_044654_769055_56F7C858 
X-CRM114-Status: UNSURE (   7.60  )
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


On Wed, 25 Dec 2024 08:14:43 +0800, Peng Fan (OSS) wrote:
> Enable the LVDS gate, MIPI DSI, PXP, FLEXIO and MU only for i.MX93,
> because i.MX91 does not support them.
> 
> Update enet clk entry format to align with others.
> 
> 

Applied, thanks!

[1/1] clk: imx: Apply some clks only for i.MX93
      commit: 48806be086360846bb308c5ee21fcab8405a3da7

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

