Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74DEAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 15:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J9S6SOIwqotZVAJUl0A8DLIjddZv342ULSoUfACurNk=; b=NmdLBxdeK4Kfw8JBicyj5u5H7U
	2zibt72oGSQLnPrnjjwov5H1+3/EmV2j4L0XTQXyPc8EpWPFUywIa3GQLZNzxTUtW5dSn5dsTGdpd
	XxCX7bOuhsiHF9NiN48rdzi/0xRl+B1wGlzXfEESzk3TtWTuuPpIYz0ORzXyJ2b7yC664UeV3NQnR
	IfMDnDyos7VmcLw9yYpfTEFPXNQilmO4WYh0wLl8I49dS429rqrtbOWFryTcg4NYCtbL+tUMczMh/
	Yw8qH1CpvbJvuSaCCb33OscrfRmQy0BIuPp8wmoz1fzQQ2YOJwopDzws0RZFZHhOg5fWHmznmOQ7s
	5oK3bZPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wglMp-0000000CuAY-0pFs;
	Mon, 06 Jul 2026 15:36:19 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wglMk-0000000Cu8p-44QI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 15:36:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783352174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J9S6SOIwqotZVAJUl0A8DLIjddZv342ULSoUfACurNk=;
	b=PHd5RgoHBq7IFUQzH4mSAOJHSQm4/oS92wU+sf0hRTKH8b0dKwMX7ze/oz/1Cwn8Ef+/dh
	/9tvDAPJuMUJOHZ0JTfhiYqBqNAGvNXp6+h7qEoEEzbKUW4bhr3motoo7Xzi/w8A89eJ7k
	8nOvy1wghEqtEmSKYzOSHjxlMMIhUvk=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-146-389jfiGqPguK0XOpyN8VUA-1; Mon, 06 Jul 2026 11:36:12 -0400
X-MC-Unique: 389jfiGqPguK0XOpyN8VUA-1
X-Mimecast-MFC-AGG-ID: 389jfiGqPguK0XOpyN8VUA_1783352172
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-7fe835353acso51525757b3.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 08:36:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783352172; x=1783956972;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J9S6SOIwqotZVAJUl0A8DLIjddZv342ULSoUfACurNk=;
        b=PYrRpIi18wApsMlrh9UMyPiDSSNuePqpTn0kBLtbZ8fGTK3lTXch5lyYCc0TO1zIo/
         JmBbnhQba0uJa+OSYyqSvNkdg1jrvjeuzQqmxP50e+sWqgcVooyDuS16H4GC1ygG8e/Q
         AxxPe7Mb9c2mjBf0YJY1FonSn8hJjHmNyIep5O75dIVr/4lbMTjfSOYPqj2Gj9CZtTjx
         Zrt6s88z9M30z3VH7ezIM/jwv5mwHlGRqPKdu9V5CAKw0Snzxb5Fb3PvlnIV0Nf9qHyd
         re/V3loUKvbFdCjFHZColeQdwWd1Sip69dTQQve/dQfsw/1KKdNZNItB+qyUJosiQweN
         yWig==
X-Forwarded-Encrypted: i=1; AHgh+Rq7+zxT+lZH98k/1jdQf3D09HZP/Ucu6lE3rev0Fmt2rPfJuDa7C3PnHs12CYeZE6sROmBVnTG/XeRjcmyuoC95@lists.infradead.org
X-Gm-Message-State: AOJu0YxMLCIZIPgn1xuEm2NPKpilBRihmOtK9uRSSg2rPAOENSGNxpH6
	JyhnVa1dmrnYksuHNKy5aSCmB5TFB50V5UGt53Cvhe2B3DLzJvq3PhFIgnOhhBuwGUabrcfNBPC
	yNN0vfjb2ZPTqnkdTu1O62/LuOEir5LnksRVvU7SKjUOYmfM3jmlYPltpS4UuYNc/V7Ri6udihg
	TY
X-Gm-Gg: AfdE7clpT/F4B8d9UJTHXyvwkMjiSLk3YCxzEQKTJnMV68PG8wgTVRtSVOUQ+11X0yd
	UQ3KiNykVMHwfPoyqWO7vZKKySigiYMFPZu7yaZhMkdgtnmhmC8vEouCGRM7FNN7DLfQEXFSfuh
	qOvPJ2fd3YRoWLslllDhG7c8Ly/sHLD/oyCIlGj6zz9/SGGVwi28mljVJxsrSsWPVEu6g/A44Ud
	jYpy6xHYY1SvyT321vZcJCskXAR5lXw36z+2Z7Xl4pZw58CVazPlKuCS2fkiM39OnCd8Nw1MFu5
	27dF2787p13IEbjdtQMMByQbotOy0H9XIECc1CwGrW1jZYxO7yAF+S/TVVa00zc3o6cT4kbI8sO
	2gNoa3v2kChZDeNfZ3awF1y6D2TU+U8miV5QEhFLY2Sa7CA==
X-Received: by 2002:a05:690c:670c:b0:7fd:825a:22d9 with SMTP id 00721157ae682-81be2774fd3mr6842587b3.44.1783352172243;
        Mon, 06 Jul 2026 08:36:12 -0700 (PDT)
X-Received: by 2002:a05:690c:670c:b0:7fd:825a:22d9 with SMTP id 00721157ae682-81be2774fd3mr6842227b3.44.1783352171750;
        Mon, 06 Jul 2026 08:36:11 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8144783cc5esm59746537b3.9.2026.07.06.08.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:36:10 -0700 (PDT)
Date: Mon, 6 Jul 2026 11:36:08 -0400
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
Subject: Re: [PATCH] clk: imx: imx8qxp-lpcg: add missing MODULE_DEVICE_TABLE()
Message-ID: <akvLaA8oZcKBRLZV@redhat.com>
References: <20260704150344.59563-1-pengpeng@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <20260704150344.59563-1-pengpeng@iscas.ac.cn>
User-Agent: Mutt/2.3.2 (2026-04-26)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xlSbGKbU8y8YayhHrQT9J1VbdxiXenTAtWzARqSgb6w_1783352172
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_083616_463640_341D56C3 
X-CRM114-Status: GOOD (  13.50  )
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

On Sat, Jul 04, 2026 at 11:01:41PM +0800, Pengpeng Hou wrote:
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


