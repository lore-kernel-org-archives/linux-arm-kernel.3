Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A61FC44539
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 07:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ylc8TXlNP8HCp9xOR7j/KXR/abtqHgmLUYlJxvcNlVU=; b=raBa92ZTUs7KYwrudNlHQWWsWN
	mthgAlSq6bXp4f04dh052xI9tc/eVVVd92w0fwCrBl7ueYO3lJJTT754C4v9Qtb7F/xHKZjNdjx+l
	RxPo1lea9P07VJBNKuPCb7UAQpY8UfSr5DvI7Tfj2gqrhVtPuyYa2JMG28btbYe95URFEm8dZuRGj
	4/fF+Grmbjyj1rjqy1i+fp1cCj7Gla9lQRua+g3+gYtELUoBe3W5jtU91sSjFuyRl0Qf4HyJJRKI1
	C2C2tMWHSf4OiZ1ruOdj2CrV5f2BH6osZ3Hg4jKq7A/Z1ZlckFtosdMWMGMD8c/BP+CnTn8O9UpMy
	71zeT+JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRnz-0000000BBed-3rqE;
	Wed, 22 Jul 2026 07:55:51 +0000
Received: from mail-wr1-f50.google.com ([209.85.221.50])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRnx-0000000BBdI-0Zni
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 07:55:50 +0000
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47f706438c3so193007f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 00:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784706946; x=1785311746; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ylc8TXlNP8HCp9xOR7j/KXR/abtqHgmLUYlJxvcNlVU=;
        b=b0MEEkCrDfnjPHtuPpNzC1Tr6NY/1Zjbyeerp+JgQ7zXI49JM/dOV5JE1kFlk292RF
         EsUjUOTF03S7vQrjRr49F4plrNQcV/4DtKoClu4SJ5yhK+wxKdswUMD5dAX7eC/sX+bF
         mBjhRoaD9VnnZGQdZvpAL2JZZFoguDwzy5iD4ZuB22OAsN70xhAZVT8Q0AEQZt9lHMry
         6bgJlxNsAV3gntrjYT1g36iCeGNnOz/ugmvi3pxQlaKyYLu2+5kPeMp9GsPMpUOge2LI
         rMV6Z/2iUW0E9y6v9hfA0FnW/5SF/8KM5t9Q70Zx45MXe/Af2L1mQp/C8hjvbtAxBqX2
         vidA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784706946; x=1785311746;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ylc8TXlNP8HCp9xOR7j/KXR/abtqHgmLUYlJxvcNlVU=;
        b=W60G23sfzJmdWoe+2c9+tvDSOqHVLDiW5ICWHYshFQn3/gWlKbnVnLGrIkck3PzEYg
         8C04DbCJ7bzuSB3bXSfjIhUr0drZT6Yu9yU+6sbF+sHpkJJ9Vx6M+NXSfQy2ebLkqFRx
         m+V+MdKFs+VcKnckz/tWTYfNCDOJTFjTdFnA7XO+dBhDFkWexe/AnOBX16wXYYxIXpq2
         YbtauX8bljIuIvkutzQhTdu37nnQfgDQU58Kyo0TxL2zd1mVqCV5/xeWvEpFwhskoY/H
         WqYSGwR99cLBH/RbHnF38gOGpQXTb7dSV4h7lgSdPFydgBsNtZ1dS7BzvxaYc/UIi4RZ
         ncjg==
X-Forwarded-Encrypted: i=1; AHgh+RpNBATiShjCfFhDawOvZXkctBz+cn7BieXSwF1aiBHyhPm9bx8TioqGDZM0LyNtjIpu4GdZdozDswxuX/7Fjsj6@lists.infradead.org
X-Gm-Message-State: AOJu0YypxvDMc38LK+U5Nl7EUE6crZVttZtSyqvEZl7Qoub2f+QaZvl8
	lUmdoyvPzjRnQN2c4UBuYpZOsndkpixJkWpITGhortQN8ZNDx7u1fD8C
X-Gm-Gg: AR+sD12K33nlDRpPraXVFRx1ZyGY3K/rAwJhKhfKmX85FVgByv7rijDHcnR6O79mVw/
	Qzfst/J8h3t0xhK5Y0LgMtgh8RbnXyQe5O1p7qRb98mSA4tkWgQMLIAbW+1hg0USqS0mwYhPtEL
	vfwcJFR3AN3801/ltm3Sa9zwPbnPbrnOj1kiRSrqLqop8OVCzRU7cXmOtBWLNsemfJbYMoGd62I
	O/Qibf+XN0FzaU97egWlFPPOuOiTbyAM+NiIzVCaRU8pmLFoN+PKo2L6n2TXm8MzKMliHIZpQZn
	xlGds6UGt8/NLz06uKyZKISQ2WMcRVNAykwPW+nqGTeNRvASqeX5LywhdG3n6Olkb7nNmrHb9/K
	VCo7C5RJQZSTQqRgmiF/oh+sJsRwwrJDNBJ/HV+SdjFupw8aLKGj1MoT2Xag2rUdOC3Tm
X-Received: by 2002:a05:6000:4687:b0:47f:8136:e7f5 with SMTP id ffacd0b85a97d-47f8136e9edmr2516706f8f.2.1784706946354;
        Wed, 22 Jul 2026 00:55:46 -0700 (PDT)
Received: from skbuf ([2a02:2f04:d801:b100:1a7a:c7e7:fc27:12d8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a64dsm3759581f8f.1.2026.07.22.00.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 00:55:45 -0700 (PDT)
Date: Wed, 22 Jul 2026 10:55:42 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Michael Walle <mwalle@kernel.org>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Tanjeff Moos <tanjeff.moos@westermo.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 phy-next 1/9] soc: fsl: guts: perform fsl_guts_init()
 error teardown in reverse order of setup
Message-ID: <20260722075542.p3uissyqzcvfsdri@skbuf>
References: <20260721231603.67865-1-vladimir.oltean@nxp.com>
 <20260721231603.67865-2-vladimir.oltean@nxp.com>
 <DK4X0XV6ZM1E.2L9G007WXO2J6@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DK4X0XV6ZM1E.2L9G007WXO2J6@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_005549_224777_B9BC1943 
X-CRM114-Status: GOOD (  13.59  )
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

On Wed, Jul 22, 2026 at 09:18:48AM +0200, Michael Walle wrote:
> Hi,
> 
> On Wed Jul 22, 2026 at 1:15 AM CEST, Vladimir Oltean wrote:
> > Michael Walle has confirmed that ignoring the error was intentional,
> > and we preserve that:
> > https://lore.kernel.org/linux-phy/DK44809N7Y8I.J2Z3U4N32H0Q@kernel.org/
> 
> I thought you wanted to check if kasprintf() fails and return an
> error? Just to be clear, I'm fine with either way.

I did, but then I considered I don't have a strong justification, and it
isn't a change I need to make to make progress with this series, rather
more of a distraction.

