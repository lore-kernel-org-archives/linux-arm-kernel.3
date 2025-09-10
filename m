Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C9E2CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 07:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7rviqFC6fi/TZM3n7DN7u+8LmUKozVvS35AUpDZHHJY=; b=0j7LFVf9mvfw9eRNmIaKDb0HbM
	BLTAxcUbgu83KMnpel1El8QT1htZoqLpAUUEo0fyVVdU5IR5pWfZe2jmYKUdfhdvQL+EcpNQx0N0z
	QQe2riuq3G9hDPaANST6cDMIyiGOTciZf5Nm9VMr9DZMUz1X2zEN7FrPL1nR+If6AWo9pB+bcuT8d
	SrWigTbJABxqo4NPDylfVVZ6z26PWfltXutEtTdCtTZOt0Xay3WkVrXFVBZkIL/tCL8tejaPdLbGQ
	14wR67pKKeFqid+fySXswyv7ZicwQeqJio4rPELAdrBZQ8NlrfRZcBZ1c/782ZU4EamUFf5cQCCPO
	ScQI+L/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwF2u-0000000CUSS-3BYN;
	Wed, 10 Sep 2025 07:15:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwF2t-0000000CUPk-0vql;
	Wed, 10 Sep 2025 07:15:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=7rviqFC6fi/TZM3n7DN7u+8LmUKozVvS35AUpDZHHJY=; b=oDTguYzBhZSCdQzrKLD7lOH0fl
	NlGtQaLueZJeMsCt60cZa1BkbuZVTpmKMjOiSLXh8jcY4kkb9EP57PDO9c/P7X9Gpsvnc5/pZPiFm
	bD+ruH5po1IaiHQ5iKd65/n8oRPGOPNltdoAT0EH53lOWCbGUYw6zm8DcI9UUz4sXJOZDRSkmOUiM
	M2AwnbcueHIHRZA45pLfzEntrdlPy3cVtqKlGIyymbEZogZDUke9S+ESQtxgB2uzWXjRI4nsYPB6G
	ipt/xqJYhE7OcIdQAYwQR+x0yPJuhb5ya9LqLFtkVy02iFX6TaHWEG1/PHs07AP6K3L06sDHd32B2
	ZvyVjT+Q==;
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwF2n-00000005kiK-2Vjw;
	Wed, 10 Sep 2025 07:15:08 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3da4c14a5f9so148114f8f.0;
        Wed, 10 Sep 2025 00:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757488504; x=1758093304; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7rviqFC6fi/TZM3n7DN7u+8LmUKozVvS35AUpDZHHJY=;
        b=TcETUnOKtVvwVARLOLNicnrWI9fOviwv6fyH1u66LpuftVfv4lyKO9re87+71lqYxR
         8DHAgn5G0yycJm+yFVmQKI1xbrAZ09YsndizJkEFi1agDXbHLhOj3xMh+djYvCDCFAxk
         Clm/QYz0ssRvh4WFEssnf4N3yHEmNgPazIfdd4vTsYk1LlZFYHc8urLrSzGbwTVjP2Bq
         KlwPMiar6iBpDCYhqOHJ/GFMzeOVfDMViLP0sNAcfsnjI+Qg24SE6LI1P6reqNyKTI+o
         B+naWungh66AWqCpjzMnU9d+55B/xiVC0yuwJF4PHVwdxP9eeNP25Jc1VeO1fn9de040
         JJxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757488504; x=1758093304;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7rviqFC6fi/TZM3n7DN7u+8LmUKozVvS35AUpDZHHJY=;
        b=f4bHL5o9Ylz09mo3NGqQIPGLyth5rwZYzATgZyKMsKU502Fvze0+MmVR5At+GFltf2
         O7Zr+7vQDYKyjg+TESdcEoUptyoVsZWFWMGS1mHhiHSo5D9xajA+ZHNJojCuHGIa/xOj
         xCB3dh3Q0GXIu1fsliInZv09ccVAzwtUGNWGPV3wdX5pR/6tmOl7GDBYAUOC/lWYpBMK
         LOLAa//vIzOTLJ/iAbtrTkjftezGU0ypCI4GzKxTTU6EvgukV2IuCpHarlQdwQEL1hvm
         e7xxyBlg+aVMvk2wH6SXwjheR+1KRwUqsXhYp8Htr1rUHNNYIHpa/uOn3081mRWGkMqa
         RiTA==
X-Forwarded-Encrypted: i=1; AJvYcCWqYnBhjXojQG+rhrbgeHubxot8YlQIiN1xPzW9ggIBWTj54S5q6c7Z/O2s2WuCFZyxjbb/Yfn0CPu6VBKrztc=@lists.infradead.org, AJvYcCXlggxFwbOViorTkFWdPLN9kmGer1UCXn/hi/qPP/XSGGVaMW8Mj7k5OthROM9fOHsJOcYmWw2TBaa1BkBolmmw@lists.infradead.org
X-Gm-Message-State: AOJu0YwSVgPHcI4fI9Ha+zJu42pfLKmtpOG69y7x4xvTDqp7p3lsHT6n
	GE9lZ8Q1LMeM2fQXnQO5z4pWUZcRGP3Ldm7pNouwd6koAp366UB906cq
X-Gm-Gg: ASbGncuXiPD+tr+yaf4seVTyObPzDIYp4bJ6UqSg7+NW82ZQWDnJqMqxqgOPDOwBzVK
	QnaTP2L9aokMOOXnLRUx3LRuBXF0Z0HrIQQgAK4l78vIw++Q8tSTVEkpX8BxUyLzzhZOAniAcWd
	71a+ct7QuAczXrXUq1yje7OQ8vs3e03HMrvLS6NZX+rChJqYk1A7IHK4cujAhDdDOCkcLWHavmq
	uwp/l3SkKcyZPL3gmurxTQkZWycLsSKvnzKH7yS/Xkb0gTtijOJXONxZ38o6OHw8MzNA9cgfqFh
	bao6XoTpokxZGWj/DcE/AKYK472bWvXULepBgpL9DPjpuq9WVhOeEr3bTdzRo74/3gY9iYsVPPU
	GXQA88AHzZqhen+w/QpIFH3JcjFGcYoPN3T/2OGr3nSob6NvDZPv1i3lNq1sIEJHs0vapxL6YEQ
	SKmOzaRTNWeTL4Xe4=
X-Google-Smtp-Source: AGHT+IFG+idW3YLhpTGmVPGFSEnkJNW+nzVsFTThsQbfnIgS3JeXNSm3rp7SBWpMcUqM9FIU0yiuDw==
X-Received: by 2002:a05:6000:288a:b0:3df:22a3:d240 with SMTP id ffacd0b85a97d-3e2ffd7fe96mr14642158f8f.4.1757488503299;
        Wed, 10 Sep 2025 00:15:03 -0700 (PDT)
Received: from Ansuel-XPS. (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df8259524sm15913775e9.21.2025.09.10.00.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 00:15:02 -0700 (PDT)
Message-ID: <68c12576.050a0220.37714e.38b3@mx.google.com>
X-Google-Original-Message-ID: <aMElcbso_bBVXRcR@Ansuel-XPS.>
Date: Wed, 10 Sep 2025 09:14:57 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>,
	linux-kernel@vger.kernel.org, Vladimir Oltean <olteanv@gmail.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Lee Jones <lee@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>
Subject: Re: [net-next PATCH v16 02/10] dt-bindings: net: dsa: Document
 support for Airoha AN8855 DSA Switch
References: <20250909004343.18790-1-ansuelsmth@gmail.com>
 <20250909004343.18790-3-ansuelsmth@gmail.com>
 <175747155888.3660326.7601418632786886363.robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <175747155888.3660326.7601418632786886363.robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_081505_816864_71C474F7 
X-CRM114-Status: GOOD (  16.78  )
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

On Tue, Sep 09, 2025 at 09:32:39PM -0500, Rob Herring (Arm) wrote:
> 
> On Tue, 09 Sep 2025 02:43:33 +0200, Christian Marangi wrote:
> > Document support for Airoha AN8855 5-port Gigabit Switch.
> > 
> > It does expose the 5 Internal PHYs on the MDIO bus and each port
> > can access the Switch register space by configurting the PHY page.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  .../net/dsa/airoha,an8855-switch.yaml         | 86 +++++++++++++++++++
> >  1 file changed, 86 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
> > 
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> 

Hi Rob,

I'm about to send new revision of this but the nvmem DT patch got merged
in his owm branch so it won't be included in this series, hence the BOT
will totally complain on the MFD patch.

Any hint on what tag to include to the patch to make the bot include
that patch from the external branch?


