Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA9CC28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 14:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zspl3wVIwLYgqNp+ulEkFdZZ5E6KvnR50Qw8FWKSplo=; b=BPYofinCrIqaz7Emy/DTm3Uma8
	eGVSpQiJMTnTtDZyQN++lDiwiJkUFFOehJyKFq6hNBK8dXqEL82Xj1baHnzK8Uxcyk/ZwkWOelvuH
	lD4CBPMWX1yoAonu67qW2jqXfsWxYzv8wKiOpgBYyGv45GkRfMBZjEmew7lUmMNXJFCdJ2LXgInRC
	hkRFlNi6xNQCJVO3FFtsaLXY1dtSw1Sp0KHmh+co2oFFuAmN73NJvtMPExJNuSY/JRO2itNQnnuZi
	5vKRPxr6ES7EB/YNEYFSejwi82Sz7PDJUn8GtHxzaL/W4ccCaM4rExk8rzItyDex759LZA0FNYsVz
	pVw9P6/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuYF4-00000006EdV-0HHW;
	Tue, 18 Mar 2025 14:48:30 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuY8q-00000006DRA-2V0X
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 14:42:05 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5e5cded3e2eso8316550a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 07:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742308923; x=1742913723; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zspl3wVIwLYgqNp+ulEkFdZZ5E6KvnR50Qw8FWKSplo=;
        b=bdl4B7MpYH80dvuV0CFEk2byPak8OalBcM3BsHcOkyBVfJqcAhNl68V2z4Lbym9lp8
         /lI9cU+tCel1w2ypptuv9QqhlWuAawEb0RLzcxY/7Ev7s0A2RA49Z5c7BlAeU77yp8ud
         UxwmhvOUs1dEJWQpJniKOnLVupl6VaqN+HuuK4t9wpBVZ2bL0eiSn2HQe/bANo8HERdK
         bfU5VMqP2NtbybNfsVVpJH7t0LoNV7zFTnbIKXnUSazif4Zv3hwkNqCyBg+DqcTXN0Qh
         0iKfohF9/CNZPeVfwngBR+ZO7GFxk/SRC7v0sXixCmC1rOQWcOf8id8gSGGRLIkrV5kH
         rDbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742308923; x=1742913723;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zspl3wVIwLYgqNp+ulEkFdZZ5E6KvnR50Qw8FWKSplo=;
        b=a5lkYTz4MoJ13EUyYZoXaupLaXJkKJRFKZP+S3ZCpC0S5Yzw2R6FlXvGDkR5uzsu+v
         rXDWtjqDFyJoWZ/H8CQN0O9PaZXMn/0LiSNh9tEThlsCJaBDgqsgBepOiH7mNmqBjGFN
         CF4sXLWuKef7UQddhrijG7xPO5Pn96BhwuoUBZS+t90TPf+NfstAwMETsuTMfmfZa+iQ
         ft0NZaw6q+++FSrWFs5E0HunaoQNBOWR9eM/fh0eifbYgQc3sUu/a9xCBDBOF1hz4DDH
         wTPhiUOJGqbHn1p7nCAu6UwDrrFyBcjpwMl1Dx8Zvr8IwQyVeyNKzFbcdwMNIqe64aex
         fwfA==
X-Forwarded-Encrypted: i=1; AJvYcCWfznuxDs+rhpCjniihdy92GqhDAQejCk1CH3TChFILSaQ3tiHUMxXvQyyBQZWGehHGcseaPOT/ZW8jyZ5mFmP0@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6/CZMYX8AYiO0AKB4vcMhT6DXfKFsDAKgtpFnS1NBYWvyxVoi
	7vQtXKGYjto0xwBP6xuInUjkTEjPWurqP5WhSsmMUTYXWruQjIHS
X-Gm-Gg: ASbGncvw7FTiT/OYLWutpBiEwdOib0/7RKiJluJj7VFrUSxxDhdAQDrzmGGJTzAdMes
	a2bh6GgTyqZE4qM4mAoSKu19y1p7P+fIz54E+xU2b5wWDxmJHM5N9d6GiQPhm8pfL65Z9njhoP0
	7BrMNm2GR/DAMuD+O19jb9+eWf5AhhYhcIYBYTDVzNLdo9oNWj2tF/mZqRFd6t81P2qncG0ChOs
	5kgLFzDnKGa4nZXTdQcEtvaAI/xSMCp9w/gvykz31efPLApQzifVkJ+kMOI6DQRhZwdaZiWIYPb
	8wYrh4BqFOvUWmy+B9cE9zXBitjHDyhFCheQ5fYnWfOKNUnwC623MQ3msqDNX+CpunIOMCXYgMl
	zWEm5NVbrzLSFzJIHqehXV8En+JJkuzOb+EXxFpU+T2LGow==
X-Google-Smtp-Source: AGHT+IH+JBVpBEJjBQE3T9bMDFZsvcfOx0v4Sq5kpGyqCVHUlHEPiHyf4bAVLVQeD76GwckPOycJng==
X-Received: by 2002:a17:907:d22:b0:abf:607b:d0d with SMTP id a640c23a62f3a-ac38d3fa372mr443830866b.16.1742308922125;
        Tue, 18 Mar 2025 07:42:02 -0700 (PDT)
Received: from alb3rt0-ThinkPad-P15-Gen-1 (host-95-251-108-181.retail.telecomitalia.it. [95.251.108.181])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e81697509csm7722106a12.30.2025.03.18.07.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 07:42:01 -0700 (PDT)
Date: Tue, 18 Mar 2025 15:41:59 +0100
From: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
To: Shawn Guo <shawnguo2@yeah.net>
Cc: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH resend v3 1/1] arm64: dts: imx93: add ddr edac support
Message-ID: <Z9mGNxfcquaYW0P0@alb3rt0-ThinkPad-P15-Gen-1>
References: <20250225192159.2907320-1-Frank.Li@nxp.com>
 <Z8+mcZw9yjOr3m/y@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8+mcZw9yjOr3m/y@dragon>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_074204_631938_17B1694A 
X-CRM114-Status: GOOD (  10.75  )
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

On Tue, Mar 11, 2025 at 10:56:49AM +0800, Shawn Guo wrote:
> On Tue, Feb 25, 2025 at 02:21:58PM -0500, Frank Li wrote:
> > Add ddr edac support for imx93.
> > 
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> 
> Applied, thanks!
> 
> 
Reviewed-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
Tested-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>

Thanks,
Alberto

