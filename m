Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C7AC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 17:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jg96pgiYAO7hs/dlNZd/6USIau75PhPvkwcnDv0elG0=; b=zUBZGSPaIql1yv0eYcK9sv5qpa
	oERqSQUqvUpWnALKDgmqanKFvhLJhBm6up3FsYHAsI+mWfTy/NDFERDS2XFXkbmtZyzOrfNmFhmVk
	wPnKQ/88tZAhlXWzKwk49uFCiI9qW9R+f0v1vbc3TDwzkJI3jrQ/t5qYPGqxRLjRYdR938orRjpj/
	IOBCrfLHNRhVIqrgHPrxPGnt8iXVqo/hBhXgHXKb88ONLiXwnnT3JFQeXXB6ddW1rJs/pHkcZEWYl
	as9nbWWMQE4tL/Hx0lAe+G6IWe3GzMuNphU5biLtXbQ+nfKFT0wsgDZxRCw7PQi/Ru+h8XfbsN1En
	dj2z0jaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkoEp-0000000ECEW-0mp0;
	Wed, 19 Feb 2025 17:51:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkoCp-0000000EBdQ-1Ek2
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 19 Feb 2025 17:49:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=jg96pgiYAO7hs/dlNZd/6USIau75PhPvkwcnDv0elG0=; b=XMC7YWLdEeX3tJTZbxTnGD+pBv
	wLriCYZGQC99XcZY72YmtKKP8hK3JS9dubxfqzCVyrz3Im/wb5Je2Mz2yUERYaCltwv+yDnl5TfRO
	a3zE0+aR7ENBU17b3vR5pV3HfjBzK4xq5yZKvqr0isH82vPdRZ85jOiXoSVHRr9ZUQFSlaXN+BSKS
	EzuIJgBoyca9ACBakudXr838TJWt5mZlEcaYyRHfKEY1PHraLOhoh4FzQ3C42pWoTykeSHmjWrDHG
	2AElWK/nfBCkR+4Ynzz1hb8x2GTCsEMQ3JOiShiYIU6fElJszMPxZYUnDNnVsfeABPzJcOUIM+IsE
	HqDHhC4A==;
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkoCm-00000002IKh-15jf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 17:49:54 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2F8503E;
	Wed, 19 Feb 2025 18:48:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739987307;
	bh=ehH8TK1UXsd8MxE8OrYZ4KkZHnWrbgI+iBbISw88D7k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qxjpHJ4twUM+bakLBtJEWS9NKWqtOJRbDhVokKIkLnCc+djLVtTuNKfeFHfek2QIY
	 +FbpMh91pxfr91KoQ+pWSRfxuMnwoxq6n30drFS6mJOI4Fz5AnJ3pjn5DUyYIELb3E
	 7rPsubtTQg07KBH46csT7LagRALlwuBWko7UlXPQ=
Date: Wed, 19 Feb 2025 19:49:34 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Vishal Sagar <vishal.sagar@amd.com>,
	Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Michal Simek <michal.simek@amd.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 06/11] drm/fourcc: Add DRM_FORMAT_XVUY2101010
Message-ID: <20250219174934.GA22240@pendragon.ideasonboard.com>
References: <20250212-xilinx-formats-v3-0-90d0fe106995@ideasonboard.com>
 <20250212-xilinx-formats-v3-6-90d0fe106995@ideasonboard.com>
 <bdpw2g65uor77tijlhpabodog7haqvdcemnr3wzqkooerzuib5@hfdn5zsrbkgg>
 <7674314f-d95a-433a-81d2-ca78bc199359@ideasonboard.com>
 <naw67daoyb2lfmq4jovlwanz5niaolptwnug3c3kkrtlfoh6dd@trkctqyzvtb5>
 <23e71045-1ae2-4e02-9780-aa11a338d481@ideasonboard.com>
 <20250219150840.GA31825@pendragon.ideasonboard.com>
 <gkqq3c6pew5etfmjqqzgxtddlu7h3tbscrijkbymls524vfrrz@uy7qysfecrjk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <gkqq3c6pew5etfmjqqzgxtddlu7h3tbscrijkbymls524vfrrz@uy7qysfecrjk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_174952_470752_38E2A8A7 
X-CRM114-Status: GOOD (  27.55  )
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

On Wed, Feb 19, 2025 at 07:28:44PM +0200, Dmitry Baryshkov wrote:
> On Wed, Feb 19, 2025 at 05:08:40PM +0200, Laurent Pinchart wrote:
> > On Wed, Feb 19, 2025 at 04:47:26PM +0200, Tomi Valkeinen wrote:
> > > Hi,
> > > 
> > > On 18/02/2025 05:26, Dmitry Baryshkov wrote:
> > > > On Mon, Feb 17, 2025 at 10:27:56PM +0200, Tomi Valkeinen wrote:
> > > >> Hi,
> > > >>
> > > >> On 17/02/2025 22:15, Dmitry Baryshkov wrote:
> > > >>> On Wed, Feb 12, 2025 at 04:56:10PM +0200, Tomi Valkeinen wrote:
> > > >>>> Add XVUY2101010, a 10 bits per component YCbCr format in a 32 bit
> > > >>>> container.
> > > >>>
> > > >>> Is there a more common name for this format? Otherwise googling for it
> > > >>> reveals only your series.
> > > >>
> > > >> In the cover letter I mention the gstreamer names where available (this
> > > >> particular format is not in gstreamer). AMD has these in their zynqmp
> > > >> documentation (https://docs.amd.com/r/en-US/ug1085-zynq-ultrascale-trm/Video-Packer-Format).
> > > >>
> > > >> XVUY2101010 is YUV444_10BPC in AMD docs.
> > > >>
> > > >> X403 is Y444_10LE32 in gstreamer, and YV24_10BPC in AMD docs.
> > > >>
> > > >> I'm not sure you'll have much more luck googling with those names, though
> > > >> =).
> > > > 
> > > > I'm asking, because include/uapi/drm/drm_fourcc.h has a pretty explicit
> > > > waiver: GL, Vulkan or other open standards. Otherwise normal
> > > > requirements apply and it's required to have an open-source usespace
> > > > implementation, etc.
> > > 
> > > I can drop DRM_FORMAT_XVUY2101010 until we get it to gstreamer. I just 
> > > had it ready, so I thought it's better to include it than leave out.
> > > 
> > > Is the current gstreamer support enough for the other formats to fulfill 
> > > the userspace requirement?
> > 
> > We've received a green light in the past to add formats to drm_fourcc.h
> > that would be used by cameras only. There's no open formal standard there, but
> > we have libcamera as a de-facto standard. I would assume GStreamer to be
> > enough for a scanout format.
> 
> Thanks for the clarification!

To make it extra clear, this format is not currently (as in the mainline
kernel, with Tomi's work) used for cameras, but only for display
scanout. My comment related to cameras was meant to indicate I expect
drm_fourcc.h to not strictly require all formats to match open formal
standards.

-- 
Regards,

Laurent Pinchart

