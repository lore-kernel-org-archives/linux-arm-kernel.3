Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E01D7F53D69
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 16:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vhmAKk+4/zPYmmEuoWhhmx7M2Dlod4lMaxpiHqopJPk=; b=XAE4emQzR6Tj7jVO8v31qIdZ0Q
	lv7tOTMkxfRAC/OI5sdQYy5yZi+7Oy5oNssXeE4Y1jdfTB6+/74Hpq5qV5cJumw6fDpawAKJ2RBIS
	CKzG1XhLmolxpIS8yrN+Ik+NFJpcuDKKFtl/u+NOTrDzrHoLptYd8fsb+RqEBIpvoe3V7WwkX31TB
	3P1J558uwQ2oeE+U2bMhCZtgDERIczZPLgS7YmJdzwVCkPv1wz9i9NcZLRwasJOC8Fa4uFyInjI/g
	bbgqYVem4t7s7n4AxHbrhtLLaRItVHL4yayzh4jMfnIR+9IHHxvBGs7HQ5S6xXCQAxAlmwpt4v1Q1
	u1IHE5yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2AO1-00000004P1E-1bKd;
	Mon, 16 Mar 2026 16:01:45 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ANx-00000004OxJ-1KTf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 16:01:43 +0000
Received: from francesco-nb (xcpe-178-82-120-96.dyn.res.sunrise.net [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id C71371FABC;
	Mon, 16 Mar 2026 17:01:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1773676898;
	bh=vhmAKk+4/zPYmmEuoWhhmx7M2Dlod4lMaxpiHqopJPk=; h=From:To:Subject;
	b=USsn5Id1GmEi1ZI96WmPiKcNx5xtNxmE3ma2bHTvCZQCOUvz0rO8RB6gxDHv2RzIk
	 3JVU78saC5ArM5uD4CAO0axgfLhJ2i8IDHgYBhFLuuF2oPkd2HlJWChqXw6BYO3qE0
	 MWqeCtDUd2O1QTdeKO05aT3spatvaXHOwJxMSXQvekKQWGVa1drmsPebFltmKrklxI
	 ecq8AnEVqRs0HuZ4FYHvwG18t1FJt/EhdBlAIkLrXsN6+F6TEK7h8f24DdfY+ER6Vl
	 sau069TI35K4nCbRPQjwhSGm8iTSkH7aWZqbzUGjhxjYhfO8j4qh01eSfJFKO/P5xu
	 dehkwvvtlNz9w==
Date: Mon, 16 Mar 2026 17:01:36 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Nicolas Dufresne <nicolas@ndufresne.ca>,
	Francesco Dolcini <francesco@dolcini.it>, ming.qian@oss.nxp.com,
	linux-media@vger.kernel.org, mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl, benjamin.gaignard@collabora.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	p.zabel@pengutronix.de, sebastian.fricke@collabora.com,
	shawnguo@kernel.org, ulf.hansson@linaro.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, m.felsch@pengutronix.de,
	fra.schnyder@gmail.com, linux-imx@nxp.com, l.stach@pengutronix.de,
	Frank.li@nxp.com, peng.fan@nxp.com, eagle.zhou@nxp.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, regressions@lists.linux.dev
Subject: Re: [PATCH v4] media: verisilicon: Fix kernel panic due to
 __initconst misuse
Message-ID: <20260316160136.GB43134@francesco-nb>
References: <20260306031059.801-1-ming.qian@oss.nxp.com>
 <20260312173349.GA137045@francesco-nb>
 <e559b822c5f4fc9167d40544172c6c450d88636a.camel@ndufresne.ca>
 <3b30506f-f651-44c4-aca2-29e99ce60cba@leemhuis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3b30506f-f651-44c4-aca2-29e99ce60cba@leemhuis.info>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_090142_171218_73B435E3 
X-CRM114-Status: GOOD (  25.44  )
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

On Mon, Mar 16, 2026 at 04:56:09PM +0100, Thorsten Leemhuis wrote:
> On 3/16/26 16:25, Nicolas Dufresne wrote:
> > Le jeudi 12 mars 2026 à 18:34 +0100, Francesco Dolcini a écrit :
> >> On Fri, Mar 06, 2026 at 11:10:57AM +0800, ming.qian@oss.nxp.com wrote:
> >>> From: Ming Qian <ming.qian@oss.nxp.com>
> >>>
> >>> Fix a kernel panic when probing the driver as a module:
> >>>
> >>>   Unable to handle kernel paging request at virtual address
> >>>   ffffd9c18eb05000
> >>>   of_find_matching_node_and_match+0x5c/0x1a0
> >>>   hantro_probe+0x2f4/0x7d0 [hantro_vpu]
> >>>
> >>> The imx8mq_vpu_shared_resources array is referenced by variant
> >>> structures through their shared_devices field. When built as a
> >>> module, __initconst causes this data to be freed after module
> >>> init, but it's later accessed during probe, causing a page fault.
> >>>
> >>> The imx8mq_vpu_shared_resources is referenced from non-init code,
> >>> so keeping __initconst or __initconst_or_module here is wrong.
> >>>
> >>> Drop the __initconst annotation and let it live in the normal .rodata
> >>> section.
> >>>
> >>> A bug of __initconst called from regular non-init probe code
> >>> leading to bugs during probe deferrals or during unbind-bind cycles.
> >>>
> >>> Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> >>> Closes: https://lore.kernel.org/all/68ef934f-baa0-4bf6-93d8-834bbc441e66@kernel.org/
> >>> Reported-by: Franz Schnyder <franz.schnyder@toradex.com>
> >>> Closes: https://lore.kernel.org/all/n3qmcb62tepxltoskpf7ws6yiirc2so62ia23b42rj3wlmpl67@rvkbuirx7kkp/
> >>> Fixes: e0203ddf9af7 ("media: verisilicon: Avoid G2 bus error while decoding H.264 and HEVC")
> >>> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> >>> Suggested-by: Marco Felsch <m.felsch@pengutronix.de>
> >>> Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
> >>> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> >>
> >> What's the plan to merge this? It fixes a quite severe regression,
> >> a boot failure.
> > 
> > To be decided this week. The commit message does not say if it was released, or
> > came in RCs (and I didn't check myself yet). I'd say, if its the first one, it
> > will go through next and backports, otherwise its is really tight to get that
> > into the RC series, but serious enough. Please fill the gap if you have time,
> > and I'll handle it later, probably tomorrow.
> 
> Well, FYI: the culprit according to the fixes tag quoted above is
> e0203ddf9af7c8 ("media: verisilicon: Avoid G2 bus error while decoding
> H.264 and HEVC") [v7.0-rc1, v6.19.6 (286d629d10640b)]. Given that this was
> * reported 11 days ago
> * reported at least two times
> * made it into a stable series
> it is something that Linus would like to see fixed by now in mainline
> afaics, as ""the rule of thumb should generally be "within a week",
> preferably before the next rc."":
> https://www.kernel.org/doc/html/next/process/handling-regressions.html#on-how-quickly-regressions-should-be-fixed
> 
> If that fix is too dangerous a revert is of course an option, too.
> 
> BTW, given that the culprit made it to a stable series, it would be a
> wise to add a stable tag to ensure it's backported (it otherweise might
> be silent dropped and/or applying might be deferred).

Absolutely ... the tag here should help b4

Cc: stable@vger.kernel.org

Francesco


