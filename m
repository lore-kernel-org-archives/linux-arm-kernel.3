Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FA5AC3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 16:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=77t87rE0+Ie/XOv1QrJlACmGkOIthRco+3O3xhyV8iE=; b=GT7XnCpRvhETLLiKKN5+6qfrjP
	02GtjgI2xxlLo5yos5nYpRL4jMyssc0m2qBM1zlPhwaKqMBjIN/wgnfSVZvYxR35/IeoNkRFHBheu
	zzl3Je5g0lcS49N2YZkWcjwGIJ78Xf9xmlU/bMM9UKUPhoj8GybaVyB/olObGbE0faQA6LOLNbGKx
	kqA2BIlZAlyBu2rI3D5AILYCwLC7Vq+JYftS1UCpgC8P2VGaJcA3BdzxLOESFEYDo3M7qqTAejPfn
	31zkG3Tyg7qm7EuIfed6pcczhTgNBtdN8MaoDk1Nk4tnX3fPtP0iATHHOp8nWNHxbmZdCVqg2VRqP
	62GwBlOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAspS-00000002QS5-3LYw;
	Fri, 02 May 2025 16:01:34 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAsf2-00000002OYZ-22xG
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 02 May 2025 15:50:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=77t87rE0+Ie/XOv1QrJlACmGkOIthRco+3O3xhyV8iE=; b=JsZFhV8j/YfgQJyEiHmt/UjETm
	13jmvuyG8AFsMfsbqorL7m3wpda5+otymSvyk+p0Frq6+IOGPJcDaUDvXJBSzmyNi7694XRNBYPR9
	CtkZC1/TDTabiqNT55T/gWUYsB3wBv+Bmo4J2x86zgfHeMZSaxJO6XtS8Rd/3d+34+aK2Uv6wb3q1
	piSXZx5MX3E3KXZ/0ewXMLSUPoLtdcNZuClTItm0j4oDStiJ3q20JRKRfn3trVSGKtxfpJd/CGio7
	xJdJ9eghN1MVeI+PK1ep19Ka2tC16w5c7oKCy7B8zRCAsONjxe3AdadzOARCykn9eCKL5qvpt0p6y
	um0hb+7Q==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAsdk-000000051JO-39jB;
	Fri, 02 May 2025 15:49:28 +0000
Date: Fri, 2 May 2025 16:49:28 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	op-tee@lists.trustedfirmware.org,
	linux-arm-kernel@lists.infradead.org,
	Olivier Masse <olivier.masse@nxp.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Yong Wu <yong.wu@mediatek.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Sumit Garg <sumit.garg@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	azarrabi@qti.qualcomm.com, Simona Vetter <simona.vetter@ffwll.ch>,
	Daniel Stone <daniel@fooishbar.org>,
	Rouven Czerwinski <rouven.czerwinski@linaro.org>,
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org
Subject: Re: [PATCH v8 09/14] cma: export cma_alloc() and cma_release()
Message-ID: <aBTpiMIevmAmp5vr@casper.infradead.org>
References: <20250502100049.1746335-1-jens.wiklander@linaro.org>
 <20250502100049.1746335-10-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502100049.1746335-10-jens.wiklander@linaro.org>
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

On Fri, May 02, 2025 at 11:59:23AM +0200, Jens Wiklander wrote:
> Export the two functions cma_alloc() and cma_release().

Why?  This is clearly part of a larger series, but you've given those of
us who are subscribed to linux-mm absolutely no information about why
you want to do this.

