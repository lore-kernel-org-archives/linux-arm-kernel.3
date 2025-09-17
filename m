Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1E92CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 17:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rx5V0/lZD/IdbtCuUfwjiSEO0Grpo0JaThAgFi8Wh8s=; b=lrSsOYzdQCUWVECefiqbNTZg9F
	BXhd5PxDjG30Cyk4/fBUM1IaInpQOtEjPA/1hK0OL/1KofU3cb6uty+06ARZdqrcVDFpjDcOi6Ldn
	M2oh1Tj6NwMJzQKuTaz66i0agWHH/P9uY/v+07+LqwWGm65iCR8zW/TNB4fA1btmn+HPxQ3oGDZDK
	135kQ6HDAV0Eu777xn0NIy+lyxd33Muy6FGt8tDfGiV0fXLeCSP6FUGs3MKnLaoV6IFnsEjkMthO6
	PylZi8gRZkN22xzhF+dWcpYw7tfwcqYythqgGT+M5FQHEew/wFamOCOeAgys4jZbQPsIghGmLlLLI
	69Il4wdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uywKH-0000000Dj7O-17tZ;
	Wed, 17 Sep 2025 17:52:17 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uywKD-0000000Dj5A-1pRU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 17:52:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Rx5V
	0/lZD/IdbtCuUfwjiSEO0Grpo0JaThAgFi8Wh8s=; b=FWgOARlfcC5bBkEhH7jG
	ITFPFlwr1VAfDuV0hIVqbDeNRxa2v7Ycn5BBKxibO0KMk2WxPeWb494SJo3SZ4QE
	RFClSWn1PObw0nS9NEb3t1IMYTqChz5GwKXqsFSu9j0TT3VWAwE6MN3au5m6mGpS
	JD/p/ucC6a7lTlJguzmIG+T8RyBoUsUmd+Cy2Cg3AZdC4PTagMr5mrvyPECtqOUh
	rSgilWdz3j4OR/4LUArMds+Rffk4gY60pYA2iLgddKm6DKEjeKNKUM0HjLkxrPzc
	/OPXKoqjG0tih5tcmDLmR3lqI7P4yCJGfxt6ZBz/cgerHqnfaKm8oige/Ejgtbyi
	sQ==
Received: (qmail 3221545 invoked from network); 17 Sep 2025 19:52:03 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Sep 2025 19:52:03 +0200
X-UD-Smtp-Session: l3s3148p1@Zdbn5AI/itEujnvK
Date: Wed, 17 Sep 2025 19:52:02 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	"Liang,  Kan" <kan.liang@linux.intel.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Ian Rogers <irogers@google.com>, Ingo Molnar <mingo@redhat.com>,
	James Clark <james.clark@linaro.org>, Jiri Olsa <jolsa@kernel.org>,
	John Garry <john.g.garry@oracle.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Leo Yan <leo.yan@linux.dev>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Rob Herring <robh@kernel.org>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 5/6] arm64: dts: renesas: Add R8A78000 X5H DTs
Message-ID: <aMr1QjI8vfrP_fwD@shikoro>
References: <87tt13i0lh.wl-kuninori.morimoto.gx@renesas.com>
 <87ms6vi0js.wl-kuninori.morimoto.gx@renesas.com>
 <86v7li1xs4.wl-maz@kernel.org>
 <87h5x1afgr.wl-kuninori.morimoto.gx@renesas.com>
 <86qzw51pmw.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86qzw51pmw.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_105213_742251_C5B0FD4D 
X-CRM114-Status: GOOD (  11.51  )
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


> > And, the datasheet is very complex, I don't think people can find it by
> > himself without any hint.
> 
> I guess we're just a bunch of inexperienced idiots unable to read a
> TRM.

Please don't feel offended. Morimoto-san really has a point here. The
datasheet available for us is currently in a very rough format with
*lots* of attached documents with hard to grasp naming. I am dealing
with R-Car datasheets for 10+ years now, and I do have a hard time
finding the information I want with this one.

That being said, I agree to the point that it is not very helpful to
reference such documentation upstream.


