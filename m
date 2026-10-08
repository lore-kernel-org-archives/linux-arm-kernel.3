Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 356C9CA6007
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 11:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pOvhPlTL7QJhMatKQPnVADUYiOtOm0sxgZCmK5Js7YI=; b=r3f3sV6YJi6SKzjh+EpTxZ+tTN
	QLUrET1ZM7VRg+Jz5EO8Fl27EZgnGEPruhNi15AtEqfSwy75sLEEAF3Rl43ZsOId8qE2/SKmVwZlo
	QGlZZiTtN006NcWc9Ms2ETuACSwTMs4NOTQpw6JgbU+JA2hTJA7n2rqPw1H8HY4as2hvem62xr5hH
	448W1bsNsYttcT6NWL1K0D6xQL5PMetJ/pPQyliWbICJVfutbfkUmmHlZN2gxgxqGKik57ycjSu7G
	mMMUvqjgKjeEbZdLLmjxz1bkSKp3/fnlKBTT8UdlbIUfX9fcCfv7xtJf5uQTxfD3q83es946uxgv6
	oWR7aR+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEmCo-00000004EH2-3DHq;
	Thu, 08 Oct 2026 11:22:34 +0000
Received: from out-78.mta1.migadu.com ([2001:41d0:203:375::4e] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEmCl-00000004EG2-2qb9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 11:22:32 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=pOvhPlTL7QJhMatKQPnVADUYiOtOm0sxgZCmK5Js7YI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791458549; v=1; x=1792063349;
 b=F2Jh0IOZhYy+e/4hbN6N8cJgAnEhHE45sptBCucCyOvVnTKPVwyOWSLmiURY+xeW3GVzNOlR
 yr7Td8lyyXH1y0VIiSVIrgM1aKbyK599nf/ziQfSe5La9b6i1e0TTI7TCPILjnzX6/0HE10qLIy
 a2/IJbIA5MygS/vOSgeTqbjQ=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 1112542ead686838;
	Thu, 08 Oct 2026 11:22:29 +0000
X-Mizu-Trace-ID: 1112542ead686838
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5ba429b64c5so5967e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 04:22:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByDogkBW2oUcL7wyhg3eyO4/s/dkS9P7DgjXS87RQAHNiLBkbJOnyRCYGQEGzhiH41qBhv1w1CAK3UV0SoeEqyc@lists.infradead.org
X-Gm-Message-State: AFq9FYKGAKrfanhr23GirdkDhsVK4eE1YYVHUbJuB+5FtmpjgK1sPula
	pGO0vKwEW7Wuyp1zwl5PKz5h6OC/6TqwPhl18FMxCNN/TGz8H+HxfzHTKYZSHPnJlTwTuE7PS6P
	8jAsuUPtL8Fl6Tzk+fDa5/3MQufwntKsjRWosKRS9
X-Received: by 2002:a05:6512:3f18:b0:5b8:c932:f056 with SMTP id
 2adb3069b0e04-5bcd5883333mr108768e87.7.1791458544264; Thu, 08 Oct 2026
 04:22:24 -0700 (PDT)
MIME-Version: 1.0
References: <20261007150255.1648849-1-vdonnefort@google.com> <20261007150255.1648849-6-vdonnefort@google.com>
In-Reply-To: <20261007150255.1648849-6-vdonnefort@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 8 Oct 2026 13:21:47 +0200
X-Gmail-Original-Message-ID: <CA+EHjTwfzp3PdsNe+BU572rvnR5y90D9y1x0DvkzE69Tycvpmg@mail.gmail.com>
X-Gm-Features: AclHuK-DqSoZ843rAUwPyVhb3bRlvEHte3k5TB9Sea6c7VQ_YeL5anSwTJMWhnI
Message-ID: <CA+EHjTwfzp3PdsNe+BU572rvnR5y90D9y1x0DvkzE69Tycvpmg@mail.gmail.com>
Subject: Re: [PATCH 5/5] drivers/virt: pkvm: Allow granule larger than PAGE_SIZE
To: Vincent Donnefort <vdonnefort@google.com>
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_042231_858072_3EBC7FA4 
X-CRM114-Status: UNSURE (   6.82  )
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

Hi Vincent,

On Wed, 07 Oct 2026 16:02:55 +0100, Vincent Donnefort
<vdonnefort@google.com> wrote:
> Both MEM_SHARE and MMIO_GUARD now support a PAGE_SIZE smaller than the
> hypervisor granule. We can relax this restriction.

nit: it would help to name the restriction, i.e., the res.a0 >
PAGE_SIZE check in pkvm_init_hyp_services().

> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

