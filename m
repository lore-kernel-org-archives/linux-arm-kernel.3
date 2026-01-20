Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 000E2D262A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 22:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oK1Xva04K7ygLWg0U7fdlOWooXBJszh65DA1fNcqFD8=; b=19D+TGsAcSYzLH4yeaWXV/TvSx
	zPJ8GAWp3Iy0ybMD4X5SeHnp91AJ+TbewDPv2xsn2+FkSmhsZLdis5gp0rL44Tqx/hCKaKGj5UAwW
	gyGW8pAEhcupK3OlosnwMwU3P3K5Yu6KJ203oGSQdtbWe3fvGQjw9pJd7cloYdvJofHrnSkB/jWg6
	hYoh9ZeCz8wEMncKDsIa1OC0nryXacIHx26CIU1NfL7iHNez15vsPsBmid2rQKyi8sdwxGdRM7G2g
	Zz3vHWlFPX/Qy3NkUa25M9XM1HbxKfiSd+73wLe2H47mEQZOeJMDSiThreioJK38mqEeadEcbFSlA
	+qd9eAig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viKG7-00000004Zu9-3hE4;
	Tue, 20 Jan 2026 22:31:35 +0000
Received: from mail-dy1-x132f.google.com ([2607:f8b0:4864:20::132f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viKG5-00000004ZtD-1Pmc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 22:31:34 +0000
Received: by mail-dy1-x132f.google.com with SMTP id 5a478bee46e88-2ad70765db9so6787539eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 14:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768948292; x=1769553092; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oK1Xva04K7ygLWg0U7fdlOWooXBJszh65DA1fNcqFD8=;
        b=RQpV+fkNMBRQDJJBTZGeouTlZSoxiTughoqpzkuz+qj9mWptZLGysHa9lwX7c4DTA5
         eI09hWwQlc+ZhO1NrDRAB5GbhmSVCbaN5EzJKP5wHMevyP8SLxKhprTsDJuQMVH8Bx3F
         EXl3iMJgEtFa8X69J3zbo0ENFKeITljInJx4sZI02zt+BoQgonEEq3HgLLeqpAsjYcSl
         nsCZlsBZ97ikdomoPCH/Ic11l2p7p+3WT1btNJ203E9l60XzfVUu3kOs1eCrtvrY/8RT
         aOFl7HfA7O412PhLcifrz/k7RARswJ5aLumN++g3HwYbFP6bKKNO9KU93n3r0zlJu6/W
         DQyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768948292; x=1769553092;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oK1Xva04K7ygLWg0U7fdlOWooXBJszh65DA1fNcqFD8=;
        b=pbrBp4zSvYV0Z81g0lUdjx0G2XVTv18UjUDnoJbrl16n8z8pMTZh//zgblS86FwVER
         UA1n3/B5y3SJDlaipnSYLzfZwdMOw+/pKbUZhlWrZqMX/9AztvJfOadbQRNqsxrJ7is/
         AIxXx5j73MAxTRdMrfK9tPeun2RasBJga/vJOMh2Z5RVkAPBZLY7I74ixuaVs6f8RPW2
         gpWtBMPvGDleD4z6NYK108vF6d/gtWjqswFCrKd+ALeAjZ3/LlLbx3tmGtIP1ZbLyfGg
         pqetep3cd3gEa018O6CoBiUaPyZKFJOmYJnB3QNFCG8Xl7byjOYkJtdaOr8l9ExEYVzN
         LC1w==
X-Forwarded-Encrypted: i=1; AJvYcCXoIwJ0tlet0/FwdkiMsmqSFPAdRJSzKFhLK5i1OK/9mwYALTVpo7ZjycoITaKgaOLyrfl2uNFPIrv2Es1Yz6kE@lists.infradead.org
X-Gm-Message-State: AOJu0YwxuiCn1gsF8JM04nNQLa+SJLgylf/nhgpKGTq1tRU0TjSJ19mn
	VWJdFe/deR6sVdhd7HWlTS4KC6EB7xk2g3b2t/6U6Xy/lfJi9km+PpwM
X-Gm-Gg: AZuq6aK4am6TzsKYt/PvGND48r2oRedg94lpDl8XY0CyANL9FeTpq85xZ6POmHBclSj
	rDfTUrqCJUn9tsqjcU1D1EwZVp1X+n7FiBMqDRu52rjyoSlQ7PMAPuoTZdA/VyhVfZ+CUGcd78G
	Fzw1xODr9SupJqSu68d3ZiqKjV0n8pnWZxvO6Wtyxg6BqBH8jMH2JtoviqMz8h0hFmlXQ0P3ivu
	7rGNqCoSmuuZhB1QnN+PYBv19bYKAixpSbPCAj9Pkz2ptL8o+QORxBxe6RzMKfjIIdr776QI37N
	BSR90m/Fjzecx/kfESzxOch4RFE5nYo4ozwYS01mp+mNwP/nPBxowrdW62JTI486WfEY8X58m0Y
	mml3HSD+q5tst78GMorn1To350RLLmaBThPzJJ5UJVDXYvRwo7cNGTtKnSGa48qtMcBzZJONag6
	2CLhVcGYI5fXcY3bk+2L1S
X-Received: by 2002:a05:7300:1493:b0:2ae:5a55:fc0a with SMTP id 5a478bee46e88-2b6b4e287acmr16477739eec.7.1768948292340;
        Tue, 20 Jan 2026 14:31:32 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b712881482sm499886eec.5.2026.01.20.14.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 14:31:32 -0800 (PST)
Date: Wed, 21 Jan 2026 06:31:22 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Inochi Amaoto <inochiama@gmail.com>
Cc: Yao Zi <me@ziyao.cc>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	Yanteng Si <siyanteng@cqsoftware.com.cn>, Yao Zi <ziyao@disroot.org>, 
	Vladimir Oltean <vladimir.oltean@nxp.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Choong Yong Liang <yong.liang.choong@linux.intel.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Shangjuan Wei <weishangjuan@eswincomputing.com>, 
	Boon Khai Ng <boon.khai.ng@altera.com>, Quentin Schulz <quentin.schulz@cherry.de>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next 1/3] dt-bindings: net: Add support for Spacemit
 K3 dwmac
Message-ID: <aXABw0zVz8n3jLlm@inochi.infowork>
References: <20260120043609.910302-1-inochiama@gmail.com>
 <20260120043609.910302-2-inochiama@gmail.com>
 <aW9fL7r0AM0flALJ@pie>
 <aW9ou-lsQQ5dVzqW@inochi.infowork>
 <9334905d-d11b-49d4-92b1-61e8cf644f0f@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9334905d-d11b-49d4-92b1-61e8cf644f0f@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_143133_382517_D18C3A9D 
X-CRM114-Status: GOOD (  20.81  )
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

On Tue, Jan 20, 2026 at 02:48:12PM +0100, Andrew Lunn wrote:
> > IIRC, the "phy" clock is used to pass the phy from the mac core, I will
> > double check if it is possible to connect to the phy directly.
> 
> Are you saying this is the reference clock output from the MAC being
> fed to the PHY? That would be a clock provider, not a clock consumer.
> 
> Or is it the reference clock output from the PHY going to the MAC?
> Then the MAC would be a consumer.
> 
> And there are some designs which have a third party generate the
> clock, and both the MAC and the PHY consume it.
> 

I have confirmed the clock is directly from the the clock tree and
is consumed only by the PHY. It seems like I have got a wrong
information about this. So let's remove it and let the phy consume
the clock if it use this clock.

Regards,
Inochi

