Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE9AC282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 21:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xp1af/B80KYujPuppsYdEEFIldQcYx8uRUo8y+LPh/s=; b=RwTnyM0ZTpLJgqhTrtcfT6+BhF
	8nGL7BZzySShWI/QJEt6IgiHXPM0wezS0D+/6Zv42cyd620d9T+515MOW9m+pnuO5BgtZsj6HLAZm
	rAnfnmHPPH8REDBFrZaeAnI1F3QImCAH0nlSn7fiUvRu5hiaWZy6GkxQEWm7jlvsIZEcKeeopxKw8
	qdrPBclH/q+5MT+cuAez3XZxAwSH2foWuOecbD4Q8zlYZgO7rrgYxRF1w5VVxEwPu5+YvCEYOoytm
	lsgU0bnwem2JVFlUg/3IKl0yumQtza+Ao4SxXE8jg8T2w1k3BdOkmr/u4OKEJFWA7IXkuu18htG+v
	huRciMjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpD0n-00000002KSk-0CDV;
	Mon, 03 Mar 2025 21:07:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpCtl-00000002JAu-0avx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 21:00:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BD4755C48DB;
	Mon,  3 Mar 2025 20:58:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D50AC4CED6;
	Mon,  3 Mar 2025 21:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741035621;
	bh=bo8HrOIlN5Xf5krNsctVKKdvPdiqrXCjvrUMmNpPcNo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hncZz6O5SzQ0KX7gjO3GOe9xzDMoa4yW4yZqipxllhuZVZIn4j8nJJO3nV3ZNPvUO
	 6g0BIa85DBrSVK/a7iEZzKSqkt/fKwSFOIWT6hlFT6mTNNSmWN4ue3kJrHpVrM2nw3
	 cJAiprxl6RVL0xdGqPbKE2yQbqkqNkDhGIwy8wXccJAROe7j4TQWhxaPsneYrHpxgt
	 7MfKR7bUWDF16JaeGY4vEDa5Mmcxr/Cy3wibEImKe/5CBQ47IYS42DNkRbZ0L78FNA
	 f5U2rDOQkXOUfYChIQR3bfp7K7jAv1jMhOuyQGRXN3juZtQSpp8B2n5XbVCRVbP6IX
	 BhdmygBOLobUA==
Date: Mon, 3 Mar 2025 13:00:19 -0800
From: Namhyung Kim <namhyung@kernel.org>
To: Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>,
	Ian Rogers <irogers@google.com>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	Will Deacon <will@kernel.org>,
	Graham Woodward <graham.woodward@arm.com>, Paschalis.Mpeis@arm.com,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 00/12] perf script: Refactor branch flags for Arm SPE
Message-ID: <Z8YYY2Q_ZPIaZ74g@google.com>
References: <20250217195908.176207-1-leo.yan@arm.com>
 <20250303093853.GG2157064@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250303093853.GG2157064@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_130025_232697_31A8F5BE 
X-CRM114-Status: GOOD (  13.18  )
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

On Mon, Mar 03, 2025 at 09:38:53AM +0000, Leo Yan wrote:
> Hi Arnaldo, Namhyung,
> 
> On Mon, Feb 17, 2025 at 07:58:56PM +0000, Leo Yan wrote:
> > This patch series refactors branch flags for support Arm SPE.  The patch
> > set is divided into two parts, the first part is for refactoring common
> > code and the second part is for enabling Arm SPE.
> 
> James has given review tags (including the new added patch 06).  Could
> you kindly pick up this series?
> 
> Sorry for pushing a bit, as we have dependency on it.

No problem, I'll add it to the tmp branch and run some tests.

Thanks,
Namhyung


