Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 487F4FF885E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Apr 2026 08:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2nhLj+NCAdlqvjsg6VNdrMh0VfYorib2luREg7Ry4sY=; b=45ivsthv9UE2yYJA3eNAYx66n3
	xS2i9wgnt9itlK2HGjRd4XKu/i1PDiUZWTOa3plQK4O6jtGj6quASAJMPzzHuRm6iAexmDJxu5iil
	ahU7CF7BmMKIHd1GIXdfWUlcL+jemHdOsGb1Ss13CXZSsf/7XWkk1THL7OTeM8Js7ht3T8cTbgThm
	1hj0Yjw55Hv7MDRCFM4NBtsZOcizL3c1hiCUwM1v8Xjd7PlqDKTnK3WJNHmaFSHOKaEwEZaaGEUId
	s5AVYW+CuA6+z1O4D8SHFVaaWE4Mj1iuhovZNj3lB+5I12ndbn0TaY0cqR59+KqQV+L50K9uRabVJ
	8VIQqhgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGuXA-0000000FLsY-0SEb;
	Sun, 26 Apr 2026 08:08:08 +0000
Received: from mail-4323.protonmail.ch ([185.70.43.23])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGuX7-0000000FLsA-2p9R
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Apr 2026 08:08:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
	s=protonmail; t=1777190882; x=1777450082;
	bh=2nhLj+NCAdlqvjsg6VNdrMh0VfYorib2luREg7Ry4sY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=JmXqHziilrQQ9zFb9Xgr+F5fYwf0wkXFKYwPSFWkd2ZIS30TAxGKfot5EK0FpJRZR
	 abi0MVvzK/aHypkN4Bl9RnH/LUGN96Z/BIxHqqUXZq9E+zKLGvUomHmNjr9dd413YH
	 WsCNkKEdkq80Me9SUrcRsDr7M7L7KW4Pp6vnCmK3VQYfzPYmZSyDYA8Y1yUD4GfPFe
	 xOvDvw+SoXwjP0wX0DFq+BShDVQV2W4lrxqLXFF2cBit4mSpRG+5TmmCllG9A5uEro
	 HRX6mQYt1JU2JESv7sarLSErt9dyduJMTNp4uzBAclpfRM16QZGoMTMOIEpb78xb59
	 rfHnKiip3OrEg==
Date: Sun, 26 Apr 2026 08:07:58 +0000
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
From: Simon Ser <contact@emersion.fr>
Cc: Vishal Sagar <vishal.sagar@amd.com>, Anatoliy Klymenko <anatoliy.klymenko@amd.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Michal Simek <michal.simek@amd.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH v10 01/11] drm/fourcc: Add warning for bad bpp
Message-ID: <Ajwmq3LEp_lB6qR-J4Zk3qzdmcxJsmcQAjZbQh9B3LjjLmadyQOnBO17J4m9ZXZaAT_7wjsAjrsbNAfw3ou7oq8CxO9fg84Mo0lYIyBpWa0=@emersion.fr>
In-Reply-To: <20260423-xilinx-formats-v10-1-c690c2b8ea89@ideasonboard.com>
References: <20260423-xilinx-formats-v10-0-c690c2b8ea89@ideasonboard.com> <20260423-xilinx-formats-v10-1-c690c2b8ea89@ideasonboard.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 1310cfb76f8581790b56aa8af4652cc66ee12f8a
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_010805_880465_DDE64AE3 
X-CRM114-Status: UNSURE (   3.91  )
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

I'm a bit concerned about zero here because none of the callers are
equipped to deal with zero AFAIU=E2=80=A6 Maybe that's fine, I'm not sure.

In any case, this is better than silently doing the wrong thing.

Acked-by: Simon Ser <contact@emersion.fr>

