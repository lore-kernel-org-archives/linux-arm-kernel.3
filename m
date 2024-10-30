Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17F1ED5CC8A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 10:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GifnlPtN7NiyeZMSkjEx+dbPyN49ofS66QMTyEeTgtw=; b=krj1QWqYxBu6JK5f1WO6jk+3oA
	8t7k1GUYABHmLfXDDD57xaMGfvmno6zujAH0RmrnACdE/vQ8R16+MM6S1eNSTvkQ5nwZLKLT0+JBC
	w1Dp6FFdLdj7dT7dTPJV34Zz8SKmN47dYJTCKQ2pd9kn74dnS9tR3SeWBiY8XOnhIm4um02lCohon
	Sg7R9JSIpCGgn/DKHrh9Wz9N+wuQeWSlBRj+DHhd5YvoHJPk2P5JYH+rdAcJAIukQez1tS4D6aHQI
	A6tIMCNIXmC2pY4wwEzWXKJ7wCf0/ZQN0a/faHTbPSG+smcf8suE+5c89J+WkawqF5ho+oeK8j7xQ
	2ixmCU3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t66CO-000000000B0-1G6m;
	Wed, 30 Oct 2024 10:45:12 +0000
Received: from mail-ed1-f49.google.com ([209.85.208.49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t662g-0000000HZQm-1hgW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 10:35:11 +0000
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5c99be0a4bbso8703791a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 03:35:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730284508; x=1730889308;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GifnlPtN7NiyeZMSkjEx+dbPyN49ofS66QMTyEeTgtw=;
        b=qOnPzhACHHas9NRpmtPhT1v4XJPSEIi2Bo6BiVLdyektq1B899xKTFQp9XDHxxPswh
         vVQc3JK1rAKVq5GhvpekWcz+O3ZzhCtAvtzdRIxt1Ocn9VtnZ1ZU5RycXWZlp9YnGlSF
         Dnwc0PtMrS0IXNwE8/efoO77KlMsJ6eFY5WVRMvgiIYpcZCN7t6KkifJ/HG8MiKuxgfK
         PBoCEfJkIhjAVXGhe2kwSAD3nDK1U1WM7lagqQijl2K5nTQ/L6UxTstFBNcrjlxhKHdo
         ZqknSNmpzNOXwtEvsOwFYmoL/EIzst5vO9GDWzm+CQg+9DPNC//ubd9zs3JYuw1cseMU
         x/Aw==
X-Forwarded-Encrypted: i=1; AJvYcCXqwKaL/QXHdFQ7BjX7rtE6lCUyo1/0wC9GEonP3UErEO3zDHNttqqkQAB1D53bl9piHnLnmS1vElGxR61SFCJe@lists.infradead.org
X-Gm-Message-State: AOJu0YyFgFvxritmilPKz7ByV3VR5zTkeH374OfM6CP0vvU5WxI26svb
	dvv8UJ48FZtqC7Qfmfz8xe4+LKc4R+a+r+zWYrEEhZLnJL4lF8g1
X-Google-Smtp-Source: AGHT+IF71lZKKH1Wi7ha9ca6zPk452ASkUG+FwwI2pKLbi61y6FlJ0tkir1WgK+psYexHGdJGCQKxg==
X-Received: by 2002:a05:6402:4403:b0:5c9:584d:17e2 with SMTP id 4fb4d7f45d1cf-5cd54a7718fmr1809727a12.3.1730284507741;
        Wed, 30 Oct 2024 03:35:07 -0700 (PDT)
Received: from gmail.com (fwdproxy-lla-113.fbsv.net. [2a03:2880:30ff:71::face:b00c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cbb629f338sm4590147a12.35.2024.10.30.03.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 03:35:07 -0700 (PDT)
Date: Wed, 30 Oct 2024 03:35:04 -0700
From: Breno Leitao <leitao@debian.org>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Madalin Bucur <madalin.bucur@nxp.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Radu Bulie <radu-andrei.bulie@nxp.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Sean Anderson <sean.anderson@linux.dev>,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next 3/3] net: dpaa_eth: extract hash using __be32
 pointer in rx_default_dqrr()
Message-ID: <20241030-lemon-flamingo-from-uranus-35f6db@leitao>
References: <20241029164317.50182-1-vladimir.oltean@nxp.com>
 <20241029164317.50182-4-vladimir.oltean@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241029164317.50182-4-vladimir.oltean@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_033510_469523_35BEB5B6 
X-CRM114-Status: GOOD (  11.15  )
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

On Tue, Oct 29, 2024 at 06:43:17PM +0200, Vladimir Oltean wrote:
> Sparse provides the following output:
> 
> warning: cast to restricted __be32
> 
> This is a harmless warning due to the fact that we dereference the hash
> stored in the FD using an incorrect type annotation. Suppress the
> warning by using the correct __be32 type instead of u32. No functional
> change.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Reviewed-by: Breno Leitao <leitao@debian.org>

