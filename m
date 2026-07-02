Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58BE0C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 18:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wtCCML4GCtPrAf6qduQMkfSK95cYT1SxvrHR4pZoPOQ=; b=ATjel/vQlGQX081vfkWlIvDDSB
	zq8yNgniCP5rtAbNYfDan0GZWXRRLweC7b/CzBLWPkamThj2U9Z+Ugb5OHZnfmW4PT9q7Pv3sJbp2
	5JmQmg5n8e5aeSF31mq3Xs6C7sTfbsaUp14W/2ni+35eLug9avypuf89sJx6432Rnclhsrvftc9jF
	ywcpv7Rnf3N8DUKrY/YbTN8I5PBndd6b4IzpWQIeFqTzO0x95w1pZEOtUtNZGGjAaJGyv5GJW0FAu
	7XKbVgX0FRymeKSRCJ2e9rSAzIDtchAJJdP8e61OeJh3Z7IiGhStv8xFzJHEMJtJL8dgudqbl0+pS
	Dbhtn6Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfLt6-00000005Dva-40sJ;
	Thu, 02 Jul 2026 18:11:49 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfLt4-00000005Dtt-0XkI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 18:11:47 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-92e5c9211d2so156448485a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 11:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783015905; x=1783620705; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wtCCML4GCtPrAf6qduQMkfSK95cYT1SxvrHR4pZoPOQ=;
        b=fhj2zusfVSru5+nT/mLL2z6V+xBq4r3XphDGNda6FNlPgMRpTOp/q6EgaCECspxZH7
         TrEwhTmQhunDM13iDQuxIzanP4MoBRtu6KwljaoYqS1D718u6T1aZbwPKLNFpn5EGWTS
         Bucbt1QgYMeXbcIK+UsqsouMBVzD7yXnycOM04oMRE4vrFhhC1/jcJMZZOzbGW2KArKP
         tAyE/Irn/ddPpTckMHMbw1kws6H1tIQFU/eWup/5LCmuZWTQHJE9WXsx4Nd1QXpdrBvH
         pUug4MF5TIxcZ6EvPbrnZDYDneCJ9xGd/8Cf8q1z5U7wxmzSE8y2TFm7G2qUZh/CPp/N
         XbWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783015905; x=1783620705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wtCCML4GCtPrAf6qduQMkfSK95cYT1SxvrHR4pZoPOQ=;
        b=l1n+RpNeOkDe/8oMgY1GncmvIbwer0pYXcG82rzAYDMMfRPpk/Q5cfqhUiVdL7ZtwC
         DCXQY35iwDt5G3Ifz1YlQsy1+lZ871/rwBe3pO7wnx3RDyBHAThAIg8GGwqxZMcp8e+K
         GkW0nbAqFqEhvomtWjupGEEsDSnTosIbSXgGON1YATYv+l/PFQgh3EV6ECpEc6r3mk05
         j2cyZwFE3u36+ypoNqukKedBxM2qoSXKNuRDwB6YbncrXHWCgBJpo9EzgNeWpklsZ9k7
         VLRydwf+yhCK71EHf0abTMWGOtl6P8Wu6pIIfv2/7AmXCxuEUNYh9rElz9ErPblTtvI0
         Ek2A==
X-Forwarded-Encrypted: i=1; AFNElJ9XHhs31xjk2XiTabwodW+RxD2Ui3u99RHG8x+CjvFdC+l6Eqfi7QIK6o7lQl2OtwrQ2nPzj7aV4GAUesHdKVvQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxNmC4WVOE9X5aV8h0fwZMXy90CsBydjsJYApYHbZSKWKqRTfmy
	1Kzv60W3LVyT4KpeYW0sNf6nSDGfprRrq32UHXrjZzJcmspjU+DwtUpT
X-Gm-Gg: AfdE7ckix83wcMbagxL5UQ8oy7dD5nlgW0ByX8ANP1wPR3CBnx7/2I5TYvVpb4ztZrS
	jzR26ba/QeZln6LSP6clUAzGgQmleHaaKUCpjjjwlNx7zNs8pHPmGyqI1Sw8pCjmnHknmMJyM9I
	nmI4SCP7V/nHLEhSaS6XIlPhsfPnpdN++tjZjENajdILJdrJ1550kjh7mtJXFQo49OHP2WZ7Ahv
	IwVtTO4e5FhqH7SW+K3jQV/jjyVWQLMH475oRSuwTrQ4MdmnYJ7JxZSuriZFkYDRrs9CZltXlHJ
	1QUuf4R00HKW/M1CZKLq6IRZuHT4sD/wFb9LMA8jxNbl7M98N5mV9ZBJZGHplF6hhx1lFd4jYzL
	FJtn+z9p0yBMQ5MA45jfT2YusAWHUQ9zGf14tI6VUwu39k92VFRnWdVnbinrCWUZzVomUdoT8a8
	tTBL/qHnkdiegRU3d+ll49T+mTAIHrfzPG4fBvHIQtN9lE6XnGHoQwgUGfpcJI0ISGFx8hz9w=
X-Received: by 2002:a05:620a:3722:b0:92e:4927:1ffa with SMTP id af79cd13be357-92e7825b2d6mr905846685a.24.1783015904823;
        Thu, 02 Jul 2026 11:11:44 -0700 (PDT)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e80194291sm274217585a.37.2026.07.02.11.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 11:11:43 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Brian Masney <bmasney@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 8/8] clk: sunxi-ng: a733: Add reset lines
Date: Thu,  2 Jul 2026 14:11:40 -0400
Message-ID: <20260702181140.883070-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310-a733-clk-v1-8-36b4e9b24457@pigmoral.tech>
References: <20260310-a733-clk-v1-8-36b4e9b24457@pigmoral.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_111146_176119_34870E99 
X-CRM114-Status: UNSURE (   8.16  )
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

Hi Junhui,

Same exercise for the reset map: I compared all 121 entries' offsets
and bit positions against the public A733 User Manual V0.92. 115 match
the manual exactly (including the multi-bit GMAC0 entry - 0x141C bits
16/17 per section 4.1.6.212 - and RST_BUS_SYSDAP at 0x7ac, which is
what makes the gate offset in patch 7/8 stand out).

The six that have no register in the public manual, in case you want
to add provenance notes near them (as already discussed for other
undocumented IDs in this series):

  - RST_BUS_SPI4       { 0x0F2C, BIT(16) }
  - RST_BUS_SGPIO      { 0x1064, BIT(16) }
  - RST_BUS_LPC        { 0x1084, BIT(16) }
  - RST_BUS_GMAC1      { 0x142C, BIT(16) }  [GMAC1 question]
  - RST_BUS_GMAC1_AXI  { 0x142C, BIT(17) }  [GMAC1 question]
  - RST_BUS_TCON_LCD2  { 0x1514, BIT(16) } - the manual documents only
    VO0_TCONLCD0_BGR (0x1504) and VO0_TCONLCD1_BGR (0x150C); there is
    no TCONLCD2 register set in V0.92

Everything else in the reset map checks out against the manual.

This analysis was done with AI assistance (Claude Code, claude-fable-5)
and each finding was checked against the cited sources.

Thanks,
Enzo

