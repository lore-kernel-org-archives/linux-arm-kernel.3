Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB1DF94CA9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 20:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3zuspwqjQXluBmm8BYsT+wPUm5BBdmNQ0nxP766NAw4=; b=vxZGBe+4B+8BC1RdSgpQvwxgDw
	nYA6JoJFLzIEh8JBjRQAhDH/l+Pp/SCW0Bw8ChkTmS6QAfB8Axhb6nRID/1R/NNAzvfjZJWkBMQaj
	l1yRUpGsq6mr2yaXxqnbY0s3Hsg2H8MqVWPju7FkClwwZ5lW6raEC1WVrxXhO5j9hr7YQUjfJwM5g
	nBMEnenUkkKD1HKWm6JqBDOhrsc9PGiWQnLtxAFOw8//Crs/z9OiYSMMClB8rRhg2VgG+i2cyBxMn
	3O2yKv/r2SZCUcmulWEKJNjgiaoTrpiLIcGaqlUBzMgn8klvHBbC3TiElhijcSnaS4AnNurG0WdX8
	nRNMWBxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFHJL-000000096oZ-0JGl;
	Tue, 21 Apr 2026 20:03:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFHJH-000000096o4-1trR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 20:03:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776801780;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3zuspwqjQXluBmm8BYsT+wPUm5BBdmNQ0nxP766NAw4=;
	b=EiKSzfC9qmKIcJQiWh75VI0zIkEmReX54SUt39LBIXmRY9JiQGxaQ0YItHSorOlePEK8MK
	d5uIPM6G6tQyicRKb1TNy2clW7Yk/oALaJKeCoVSjpm5/gGw3BZYaTfBav4VQH9TXDY6aq
	6lu+GIt2JUiYuiRSiD952XfSPJ/LImc=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-3-r8BSsYt8OkWnh0zTtuhBEA-1; Tue, 21 Apr 2026 16:02:59 -0400
X-MC-Unique: r8BSsYt8OkWnh0zTtuhBEA-1
X-Mimecast-MFC-AGG-ID: r8BSsYt8OkWnh0zTtuhBEA_1776801779
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8acb26fbbb2so70005686d6.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 13:02:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776801779; x=1777406579;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3zuspwqjQXluBmm8BYsT+wPUm5BBdmNQ0nxP766NAw4=;
        b=rgKTIdCU8O1t8yzGe6m/MGn4JTgV0NfQy93xZz0FtbBx/BgehqVhtVvuwPrkyzks13
         6k9QxFJf6/Y4p6guZC/I1igCvWpm8PL0/65hyiGrOwWPmI/q7Z9ihk22qrpY8BcgpjGz
         9qYpC++9ABTfND1hKPpt451iqRWxvnsdHDC3aeMe/OWWSnwM6AiUDVe2WhSenVKyzEx7
         aPlyFAltJd+zhxmjtrnPGo+OwHh9yduMsesfU6bfhH2Zb4l9rHga3G5zHPYIE3hFn5SX
         IjyimJ6IVXNfPzpWUOdZdZ5YiQyNmWu5aPbmk80Zzhtc0LP3wb1NvxUmQzfvt0ckexaF
         PrIA==
X-Forwarded-Encrypted: i=1; AFNElJ9zj8CBOw+9IWSldxZzNDc1qAfS6mvzuQMfYA07YRVsBR7/WDtFgRRo9zt4uebSRA1HfdbPGqtn+uCyxaxKiBMZ@lists.infradead.org
X-Gm-Message-State: AOJu0YznqjuWXSXBzsF7Ee3DpDOO8JjMa95BjPqatxZeIBVH3rVM8Ib8
	Z9K+rSxzPSXU2ElAC42DigPi66zgWACnSQ+lsPVwS4K3cgMGqy5QtDmniZ4vVAP5CowRzQVMsvN
	ZN+XiBKXAN8qYZiQOXBsbxe2LsVEe7JcAE+jeXYy8YGn46zKGHp7bu1hzXF811u3JHX7Yw8yNUI
	TQ
X-Gm-Gg: AeBDietSflIwuuVXQEyl3C8uJgDA377eFNDm+7KAbrxZnVmy/8UNVBX1UZFZ0Jl7Xpc
	8uhe60A23ajrZ2c9PHkYjO7apBOiwNGXFY+DXodHAtsN+e3K+intuENowHF3qpUdsymH9YrP8QP
	0YkyrFzatEtSrW0WV4bGrxREGYE3AtBUuz2jt8l28dfy8G0q2tP+9/bQWYOI7LUqlaRItWzPCZo
	WBQSfNMNWTdoyX//RY8nfuzTeM5MJRh+fyG2kv831AOEw0GNyydZi1ztvmHCVC43mA+5KBqQHDo
	xoFJ5A8Di5692Nua0/45/byKvjFnVtqBkdKA9K/9oCrRrY5QrB8u/cZORMsFgIXydqXBFcxd/4n
	SjlU5Rhb/Qb5UbjcJBek24YVYEeVtJgyFNzWR8wj//w==
X-Received: by 2002:a05:6214:5b87:b0:8ac:a5a0:481 with SMTP id 6a1803df08f44-8b028015984mr335683686d6.4.1776801778619;
        Tue, 21 Apr 2026 13:02:58 -0700 (PDT)
X-Received: by 2002:a05:6214:5b87:b0:8ac:a5a0:481 with SMTP id 6a1803df08f44-8b028015984mr335682706d6.4.1776801778111;
        Tue, 21 Apr 2026 13:02:58 -0700 (PDT)
Received: from rh-jkangas-kernel ([2601:1c2:4400:6bf0:7677:bcee:4ef0:e09d])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ae5ec2dsm115982646d6.29.2026.04.21.13.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 13:02:57 -0700 (PDT)
Date: Tue, 21 Apr 2026 13:02:52 -0700
From: Jared Kangas <jkangas@redhat.com>
To: jan.petrous@oss.nxp.com
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	rmk+kernel@armlinux.org.uk, vladimir.oltean@nxp.com,
	boon.khai.ng@altera.com
Subject: Re: [PATCH v11 4/4] stmmac: s32: enable support for Multi-IRQ mode
Message-ID: <aefX7Ajltzt5EqIR@rh-jkangas-kernel>
References: <20260312-dwmac_multi_irq-v11-0-09621ccb040b@oss.nxp.com>
 <20260312-dwmac_multi_irq-v11-4-09621ccb040b@oss.nxp.com>
MIME-Version: 1.0
In-Reply-To: <20260312-dwmac_multi_irq-v11-4-09621ccb040b@oss.nxp.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OLCFa-72a715_UhHH03CgdVOv52fky22NqYQ0h931hU_1776801779
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_130303_566508_C23134E8 
X-CRM114-Status: GOOD (  14.43  )
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

Hi Jan,

On Thu, Mar 12, 2026 at 09:55:30AM +0100, Jan Petrous via B4 Relay wrote:
> From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> 
> Based on previous changes in platform driver, the vendor
> glue driver can enable Multi-IRQ mode, if needed.
> 
> [...]
> 
> If those prerequisites are met, the driver switches to Multi-IRQ mode,
> using per-queue IRQs for rx/tx data pathr:
> 
> [    1.387045] s32-dwmac 4033c000.ethernet: Multi-IRQ mode (per queue IRQs) selected
> 
> Now the driver owns all queues IRQs:
> 
> root@s32g399aevb3:~# grep eth /proc/interrupts
>  29:    0    0    0    0    0    0    0    0    GICv3  89 Level   eth0:mac
>  30:    0    0    0    0    0    0    0    0    GICv3  91 Level   eth0:rx-0
>  31:    0    0    0    0    0    0    0    0    GICv3  93 Level   eth0:rx-1
>  32:    0    0    0    0    0    0    0    0    GICv3  95 Level   eth0:rx-2
>  33:    0    0    0    0    0    0    0    0    GICv3  97 Level   eth0:rx-3
>  34:    0    0    0    0    0    0    0    0    GICv3  99 Level   eth0:rx-4
>  35:    0    0    0    0    0    0    0    0    GICv3  90 Level   eth0:tx-0
>  36:    0    0    0    0    0    0    0    0    GICv3  92 Level   eth0:tx-1
>  37:    0    0    0    0    0    0    0    0    GICv3  94 Level   eth0:tx-2
>  38:    0    0    0    0    0    0    0    0    GICv3  96 Level   eth0:tx-3
>  39:    0    0    0    0    0    0    0    0    GICv3  98 Level   eth0:tx-4

I ran this series' changes on an NXP S32G-VNP-RDB3 (dwmac-s32) and
confirmed multichannel TX by doing a basic iperf3 throughput test:

    # dmesg | grep Multi-IRQ
    [   37.463467] s32-dwmac 4033c000.ethernet: Multi-IRQ mode (per queue IRQs) selected
    # iperf3 -s
    [connection logs snipped]
    # grep end0 /proc/interrupts | column -t
    29:  0      0  0  0  0  0  0  0  GICv3  89  Level  end0:mac
    30:  968    0  0  0  0  0  0  0  GICv3  90  Level  end0:tx-0
    31:  0      3  0  0  0  0  0  0  GICv3  92  Level  end0:tx-1
    32:  0      0  3  0  0  0  0  0  GICv3  94  Level  end0:tx-2
    33:  0      0  0  3  0  0  0  0  GICv3  96  Level  end0:tx-3
    34:  0      0  0  0  3  0  0  0  GICv3  98  Level  end0:tx-4
    35:  67302  0  0  0  0  0  0  0  GICv3  91  Level  end0:rx-0
    36:  0      0  0  0  0  0  0  0  GICv3  93  Level  end0:rx-1
    37:  0      0  0  0  0  0  0  0  GICv3  95  Level  end0:rx-2
    38:  0      0  0  0  0  0  0  0  GICv3  97  Level  end0:rx-3
    39:  0      0  0  0  0  0  0  0  GICv3  99  Level  end0:rx-4

Also tried out multichannel RX by adding 'snps,route-multi-broad' to
rx-queues-config/queue2 in the devicetree, which showed activity on
the corresponding rx-2 entry:

    # grep end0 /proc/interrupts | column -t
    29:  0   0  0   0  0  0  0  0  GICv3  89  Level  end0:mac
    30:  4   0  0   0  0  0  0  0  GICv3  90  Level  end0:tx-0
    31:  0   1  0   0  0  0  0  0  GICv3  92  Level  end0:tx-1
    32:  0   0  1   0  0  0  0  0  GICv3  94  Level  end0:tx-2
    33:  0   0  0   0  0  0  0  0  GICv3  96  Level  end0:tx-3
    34:  0   0  0   0  1  0  0  0  GICv3  98  Level  end0:tx-4
    35:  68  0  0   0  0  0  0  0  GICv3  91  Level  end0:rx-0
    36:  0   0  0   0  0  0  0  0  GICv3  93  Level  end0:rx-1
    37:  0   0  91  0  0  0  0  0  GICv3  95  Level  end0:rx-2
    38:  0   0  0   0  0  0  0  0  GICv3  97  Level  end0:rx-3
    39:  0   0  0   0  0  0  0  0  GICv3  99  Level  end0:rx-4

I didn't see any regressions with light network usage, and both TX/RX
appear to function as expected.

Tested-by: Jared Kangas <jkangas@redhat.com>


