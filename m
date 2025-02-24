Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE99C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 14:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8y7RULCgtA+twMB2yoTCUBB2R8TtZLUOKexPHO9EEnY=; b=kmVpsWS1q5P8xwoGukYqCnY5Mt
	NADWC50COWUp5kTHc4HgbExl3bNaA/JZtIZQqHrsK9uuU1Y76G4/XbS/hKndi+zw40NQyATl/JTGm
	kjYPr+t22S6iG44rNZNbY9O5Bq5i4h6yL9qGVivsrxUw24vGN0tstVb3JJlL0tKoa9q84i1ng21X7
	JuLjtvewRl04xhuz14lGNrOO4q4Vi2+inNy7Um4fBuuf/lHAtMgDaRo3e9k7nNV1qmiv/w18GvgdE
	YAytBvOMNKvwH2rzxxODC2UIDfSylst2EmTZW84ZK/05VL2kCIKTsWdcemIVBt44YWrcuIvB8KR4C
	rIKrh6iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmZfw-0000000E99i-2pdS;
	Mon, 24 Feb 2025 14:43:16 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmZH6-0000000E3uH-2M4r
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 14:17:37 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1740406643; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jh4G+fge5VpcjAQvBdSnRAzNFmDfBuNbnwANkTlPuMo4R32/1T5hKa5IFixFAXUtxBaITENB/2oVbSbzmXC5sU4qoOmLFi++ReaOhpn2XjVrwOOK0CwlTV4ZNJOdndnrOflbm9y5zo6GPNdBJtT3miYK42lSUkcUQ1ADdDRKWf8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1740406643; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=8y7RULCgtA+twMB2yoTCUBB2R8TtZLUOKexPHO9EEnY=; 
	b=UM59J+AyUZGyT5ZELv/DWFRQl6CzSlHRC433YB5pMxBv7mHp8AhcCfjNwFaoLtqjstSEQjfj08bjw5iAHb7LQuilMZPt58xJfJ0DgREAqCERZW16dURYG5hALvUFPM4VvwZXfpgRKzrZxM7jcoFtykbimhY/QA5dMwoenaF6SEk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740406643;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=8y7RULCgtA+twMB2yoTCUBB2R8TtZLUOKexPHO9EEnY=;
	b=ZmFz/uEhN425WoWrs4s1sezOV6J9789a3rllYJQU+DFg/XxZcrotZsP9G4pyx3HD
	e4YKJT08UbPcbCPDBBIzj60wK2wH7KVP2u3UJbk93cJnXIf3MmFQrcFoMDk383jYLU8
	BE/CaejoUqQQZ+TsgotKmNRWAzHlCRuIrHOwixl4=
Received: by mx.zohomail.com with SMTPS id 1740406641336970.3444548054779;
	Mon, 24 Feb 2025 06:17:21 -0800 (PST)
Date: Mon, 24 Feb 2025 15:17:12 +0100
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Ming Qian <ming.qian@oss.nxp.com>
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, nicolas@ndufresne.ca,
	shawnguo@kernel.org, robh+dt@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
	xiahong.bao@nxp.com, eagle.zhou@nxp.com, tao.jiang_2@nxp.com,
	imx@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/2] media: amphion: Add a frame flush mode for decoder
Message-ID: <20250224141712.soexl43hrimwf236@basti-XPS-13-9310>
References: <20250117075720.4018076-1-ming.qian@oss.nxp.com>
 <20250117075720.4018076-2-ming.qian@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20250117075720.4018076-2-ming.qian@oss.nxp.com>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_061736_684999_AD426EE4 
X-CRM114-Status: GOOD (  18.97  )
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

Hey Ming,

On 17.01.2025 16:57, Ming Qian wrote:
>The amphion decoder will pre-parse 3 frames before decoding the first
>frame. If we append a flush padding data after frame, the decoder
>will finish parsing and start to decode when the flush data is parsed.
>It can reduce the decoding latency.
>In the past, we only enable this mode when the display delay is set to
>0. But we still can enable this mode without changing the display order,
>so we add a frame_flush_mode parameter to enable it.

My recommendation:

By default the amphion decoder will pre-parse 3 frames before starting
to decode the first frame. Alternatively, a block of flush padding data
can be appended to the frame, which will ensure that the decoder can
start decoding immediately after parsing the flush padding data, thus
potentially reducing decoding latency.
This mode was previously only enabled, when the display delay was set to
0. Allow the user to manually toggle the use of that mode via a module
parameter called frame_flush_mode, which enables the mode without
changing the display order.


Which fixes a few grammatical issues and tries to be a bit more clear.
But please confirm to me that I hit your intended meaning.

More comments below ...

>
>Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
>---
> drivers/media/platform/amphion/vpu_malone.c | 5 ++++-
> 1 file changed, 4 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/media/platform/amphion/vpu_malone.c b/drivers/media/platform/amphion/vpu_malone.c
>index 1d9e10d9bec1..f07660dc3b07 100644
>--- a/drivers/media/platform/amphion/vpu_malone.c
>+++ b/drivers/media/platform/amphion/vpu_malone.c
>@@ -25,6 +25,9 @@
> #include "vpu_imx8q.h"
> #include "vpu_malone.h"
>
>+static bool frame_flush_mode;
>+module_param(frame_flush_mode, bool, 0644);

Could you add a comment here that makes clear to the reader briefly what
the expected behavior of frame_flush_mode = 0 and frame_flush_mode = 1
is?

>+
> #define CMD_SIZE			25600
> #define MSG_SIZE			25600
> #define CODEC_SIZE			0x1000
>@@ -1579,7 +1582,7 @@ static int vpu_malone_input_frame_data(struct vpu_malone_str_buffer __iomem *str
>
> 	vpu_malone_update_wptr(str_buf, wptr);
>
>-	if (disp_imm && !vpu_vb_is_codecconfig(vbuf)) {
>+	if ((disp_imm || frame_flush_mode) && !vpu_vb_is_codecconfig(vbuf)) {

So you say that the mode was enabled with display delay set to 0,
meaning (disp_imm = 1) == (display delay = 0), right? E.g. disp_imm
means display_immediately I guess.

I think this all deserves a lot better documentation, otherwise the code
becomes quite cryptic. Could you add a comment before this line, which
explains the entry conditions disp_imm & frame_flush_mode and the
codeconfig thing and that explains briefly what kind of mode we are
entering here?

> 		ret = vpu_malone_add_scode(inst->core->iface,
> 					   inst->id,
> 					   &inst->stream_buffer,
>-- 
>2.43.0-rc1
>
>

Regards,
Sebastian Fricke

