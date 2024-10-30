Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6001D74957
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 02:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+/o5XK5OJrkzuHt0jaoQyx3CwN+lOhE6gCV0XZuBDN8=; b=PTHTATCQRJOCfXT+SHd2/CiI29
	am5VOb6aORx4wBCXXpD9DrSBNRHT2dmC0nllxfgjo27BlI7W8Nt2NnAG1sg7ipWbFHCQsR9Hy34rH
	gKfOsNwJ0/ZpGVYeNRbr6DUIRS7V/TDLL16PFcLkxZlfoWB3QWbkXk3N+7ZKHSF1stKklaLb7KjGk
	gA3HvgnGzjxD3TtZL92ur8M4xzX1vOAY86DxYzC2NGa43R6Px3wDTrxw1aLg5DIccVDwItZ0x6UOJ
	gmJejERCQaJPliGZKsnHOsMenJ7o9yPCQ/oloF8ToWz5MWvVbQCXHAa9bh7YPlsfVLySNaaYArsdg
	/cbzpCgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5yVJ-0000000GWkO-2LlE;
	Wed, 30 Oct 2024 02:32:13 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5yT0-0000000GWPI-3geX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 02:29:52 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2e59746062fso4963418a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 19:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730255390; x=1730860190; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+/o5XK5OJrkzuHt0jaoQyx3CwN+lOhE6gCV0XZuBDN8=;
        b=WvIOX4i/AV4NEHI3H645M61+YwT8Ybvg4Q356WeaLrlKiAXKPWKJHe0ts8R0EM7Aif
         Vm37svlC2GmyImn5HPNXShvRRfV8PSkxF32v4CzpNJBIcDwBMMvhjTKoaFjahllrPpGm
         3iiFnEl4Fk+GQgdLOGyMmCNKRz6S/0xBhsEWQIP/Lnep4Va7d8UNJp91Mp10i64C3NYX
         QFETGWXsbQuXBdbdv70CGaN/rrV1oj/Hn74u01vWHCHKaog4YzFJtfgFVzIerYPGGa4/
         oCfZHD8K9pYZATgAJ2zpHRJeQPT0feNYAXScOzZH3/c803Jyluvr28EIZoUiqCaL5UlO
         q+lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730255390; x=1730860190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+/o5XK5OJrkzuHt0jaoQyx3CwN+lOhE6gCV0XZuBDN8=;
        b=ADRtIiHB88FQGEWomi3aXkZEs2TeQZi28CARZaldfZkMcKUWcuTE4X4YhSrIRydPg7
         g7B8/DpHcqBihVm9HsMGk2vHAzTUAomnYl73TW7kQAkB25uSn1JS60zQg++lotSU/And
         xWbZUVsTv9ZUrBOIL4PJlyHAtksSikF1oz03fQ8UrdjS6kdakmFIdj4qj7Hzlkmh+G8W
         sc499myGX/BhWe2OX9Uj/MBID1qvQ0EFzSlRVCB9vaBdI+uLJqh6vUls95Eb/mevG+6w
         EK0LMBodG5VFdQSo6arfZhkZPYdMc2r8mA80bRwvwHw/jXFAz7PlDRgIavBAlTZsby/+
         ZjCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWfmzIJoUVgR3rLGGKDBbTuYWnjtDQP+kOkE9+SHbwFcyy5e4HfEBpeNjmCJ79gRYBGl5eirc5bBqDz8L17v30@lists.infradead.org
X-Gm-Message-State: AOJu0Yzs0+w8CC1PIfclwRcr+ibwNbUckitWa5TV5vcuz+c6DMr4fJrO
	fyXQp4lwbIbS3968ETUAxldCXCXcT3p/ogD8rPqeCsn5O7cST/bO
X-Google-Smtp-Source: AGHT+IFijIy1xOySQ/m5xGQRS6VrQCf5Idul7+RyGkBFMYnlMj95XQcicMtXJGIScuTdNjzKS8VqNw==
X-Received: by 2002:a17:90a:c703:b0:2d8:7561:db71 with SMTP id 98e67ed59e1d1-2e8f10a6eadmr14210471a91.25.1730255389397;
        Tue, 29 Oct 2024 19:29:49 -0700 (PDT)
Received: from localhost ([129.146.253.192])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e92fa0ed8fsm431801a91.3.2024.10.29.19.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 19:29:49 -0700 (PDT)
Date: Wed, 30 Oct 2024 10:29:35 +0800
From: Furong Xu <0x1207@gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Andrew
 Lunn <andrew@lunn.ch>, Simon Horman <horms@kernel.org>,
 andrew+netdev@lunn.ch, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com
Subject: Re: [PATCH net-next v5 3/6] net: stmmac: Refactor FPE functions to
 generic version
Message-ID: <20241030102935.00005ad5@gmail.com>
In-Reply-To: <20241029185231.fgy6tofi2uoslp3l@skbuf>
References: <cover.1730084449.git.0x1207@gmail.com>
	<0f13217c5f7a543121286f13b389b5800bde1730.1730084449.git.0x1207@gmail.com>
	<20241029185231.fgy6tofi2uoslp3l@skbuf>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_192950_955789_432E1258 
X-CRM114-Status: GOOD (  15.67  )
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

Hi Vladimir,

On Tue, 29 Oct 2024 20:52:31 +0200, Vladimir Oltean <olteanv@gmail.com> wrote:
> Let's not change the output of stmmac_dma_cap_show() sysfs attribute if
> we don't have to. Who knows what depends on that. It's better to
> introduce stmmac_fpe_supported(), which tests for both conditions,
> and use it throughout (except, of course, for the sysfs, which should
> still print the raw DMA capability).

stmmac_fpe_supported() is a better option, thanks.

> 
> Which devices would those even be, which support FPE but the driver
> doesn't deal with them (after your XGMAC addition), do you have any idea?
> 

Well, nobody can tell that but only Synopsys, as you can see that
stmmac_hwif_entry in hwif.c defines quite a few MAC cores.

Since FPE have been an optional implementation for MAC cores, so I think
we should not convert FPE implementation from optional to mandatory for
new MAC cores, for example, a new MAC support is pending for merge:
https://lore.kernel.org/netdev/20240904054815.1341712-1-jitendra.vegiraju@broadcom.com/

stmmac_fpe_supported() is a perfect option to handle these concerns.

