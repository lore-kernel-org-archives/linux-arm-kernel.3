Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BCF2C021A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 16:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=681ubr2yNewIQqxC054xPg8+eBAOGYYdn+NBIKKdGdE=; b=bE6PYu+XAL8FviPkeSd7pwUHLa
	kHlsK/oRv8Jpj8j2g56/cOfC0hVuKiLIEzRmuOdghTL5rkIMnIeUHAf7PPvwedTy9tFI7/r0hY37w
	JEMbUY1kVyZ/vETe0w//ff+iE+UXoiZZ7C0QEDFez5w+BmpeIVY+k3annAZPXIuP8Ib2prtoefdkd
	2gki6z8d/7qmAnsofWueGY3TF5xQQ1stcz+HNseMAwaRjuw0F0v3uLd3bSGmNYqG12iFlm949TRvv
	DYwPOStPW/4xocdp07fp6z4mu7k04TO50jYZwOUk79uLDa6VwAoVeYX4ISuY4v9gOvPqgpPPaoHGD
	Q5yAA3mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thskg-00000004Ppa-1xF2;
	Tue, 11 Feb 2025 16:04:46 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thsjG-00000004PZ3-0xKX;
	Tue, 11 Feb 2025 16:03:19 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1739289784; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QSjSAVX2EjM0Zkd4t3XxNiDwxfY5+9s3grENOIXcAKKTLAAxTSULL7cYBGYfuyA++2l/A6ei0G3wEAi2TARhCscUM8HGLD0zz0bM5g8U2fohtTwiUeqdUKUAisprotOTwjl0Vz/PCHmI+tZWhXfiIKXsocXABnSZBYp2v6/puKM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1739289784; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=681ubr2yNewIQqxC054xPg8+eBAOGYYdn+NBIKKdGdE=; 
	b=CxXWXC+2+CoQDHM1+VTzIrn1O48zJzrD1fTy+um0LKvljz6PnSsQnF0xh4RP+m/SxuGWo2ZvGoP1mH2ux/6jf2ZGCQHAALMShnu1sB0PpP2v0KmmHWUpGdMWV8DmK5dEkJkEp/6Cz0Nnezcb2tREb9tFudIOlN58e6dPv8LHQBs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1739289784;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=681ubr2yNewIQqxC054xPg8+eBAOGYYdn+NBIKKdGdE=;
	b=iQxBb7tCOEFCGiOuMrO42BS2uKeduRpsKygpLIiaenhuke650/Qi/ZWm7c5LX7jU
	2WQ01zzgqpxtNFAiGZYptUkqrcriCKHetHsE4xX07j+hg+W9RQCfE0nq/H2GcKd2Guu
	bxYbJBVrawrKFxk2nyBLcobTb0yW++773DNvtIlU=
Received: by mx.zohomail.com with SMTPS id 1739289781881942.8989499803911;
	Tue, 11 Feb 2025 08:03:01 -0800 (PST)
Message-ID: <dd41b33d-e73a-4ff8-803f-00a3ab7c9c4b@collabora.com>
Date: Tue, 11 Feb 2025 19:02:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v5 4/4] media: platform: synopsys: Add support for
 HDMI input driver
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Shreeya Patel <shreeya.patel@collabora.com>, heiko@sntech.de,
 mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 p.zabel@pengutronix.de, jose.abreu@synopsys.com, nelson.costa@synopsys.com,
 shawn.wen@rock-chips.com, nicolas.dufresne@collabora.com,
 hverkuil-cisco@xs4all.nl
References: <20241210193904.883225-1-shreeya.patel@collabora.com>
 <20241210193904.883225-5-shreeya.patel@collabora.com>
 <b6ee761c-6941-473b-aa5e-2dadb69767f2@xs4all.nl>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <b6ee761c-6941-473b-aa5e-2dadb69767f2@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_080318_337713_1E998FDE 
X-CRM114-Status: GOOD (  20.55  )
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

On 2/10/25 16:46, Hans Verkuil wrote:
...
>> +static bool hdmirx_check_timing_valid(struct v4l2_bt_timings *bt)
>> +{
>> +	if (bt->width < 100 || bt->width > 5000 ||
>> +	    bt->height < 100 || bt->height > 5000)
>> +		return false;
>> +
>> +	if (!bt->hsync || bt->hsync > 200 ||
>> +	    !bt->vsync || bt->vsync > 100)
>> +		return false;
>> +
>> +	if (!bt->hbackporch || bt->hbackporch > 2000 ||
>> +	    !bt->vbackporch || bt->vbackporch > 2000)
>> +		return false;
>> +
>> +	if (!bt->hfrontporch || bt->hfrontporch > 2000 ||
>> +	    !bt->vfrontporch || bt->vfrontporch > 2000)
>> +		return false;
> 
> I asked before, but are these hardware limitations or just sanity checks?
> Please document.

These should be sanity checks. We added comment explaining what this
code does, telling that we need to repeat checking the timing values
until they become valid. This is borrowed from downstream driver,
whether these values are tied to hw limits is unknown, we couldn't find
the exact limits documented in TRM.

...
>> +static int hdmirx_set_edid(struct file *file, void *fh, struct v4l2_edid *edid)
>> +{
>> +	struct hdmirx_stream *stream = video_drvdata(file);
>> +	struct snps_hdmirx_dev *hdmirx_dev = stream->hdmirx_dev;
>> +	u16 phys_addr;
>> +	int ret;
>> +
>> +	if (edid->pad)
>> +		return -EINVAL;
>> +
>> +	if (edid->start_block)
>> +		return -EINVAL;
>> +
>> +	if (edid->blocks > EDID_NUM_BLOCKS_MAX) {
>> +		edid->blocks = EDID_NUM_BLOCKS_MAX;
>> +		return -E2BIG;
>> +	}
>> +
>> +	if (!edid->blocks) {
>> +		cec_phys_addr_invalidate(hdmirx_dev->cec->adap);
>> +		hdmirx_dev->edid_blocks_written = 0;
> 
> This must pull the HPD low, but that doesn't happen.

Good catch, will fix.

...
>> +static void hdmirx_get_avi_infoframe(struct snps_hdmirx_dev *hdmirx_dev)
>> +{
>> +	struct v4l2_device *v4l2_dev = &hdmirx_dev->v4l2_dev;
>> +	union hdmi_infoframe frame = {};
>> +	int err, i, b, itr = 0;
>> +	u8 aviif[3 + 7 * 4];
>> +	u32 val;
>> +
>> +	aviif[itr++] = HDMI_INFOFRAME_TYPE_AVI;
>> +	val = hdmirx_readl(hdmirx_dev, PKTDEC_AVIIF_PH2_1);
>> +	aviif[itr++] = val & 0xff;
>> +	aviif[itr++] = (val >> 8) & 0xff;
>> +
>> +	for (i = 0; i < 7; i++) {
>> +		val = hdmirx_readl(hdmirx_dev, PKTDEC_AVIIF_PB3_0 + 4 * i);
>> +
>> +		for (b = 0; b < 4; b++)
>> +			aviif[itr++] = (val >> (8 * b)) & 0xff;
>> +	}
>> +
>> +	err = hdmi_infoframe_unpack(&frame, aviif, sizeof(aviif));
>> +	if (err) {
>> +		v4l2_err(v4l2_dev, "failed to unpack AVI infoframe\n");
>> +		return;
>> +	}
>> +
>> +	v4l2_ctrl_s_ctrl(hdmirx_dev->rgb_range, frame.avi.quantization_range);
>> +
>> +	if (frame.avi.itc)
>> +		v4l2_ctrl_s_ctrl(hdmirx_dev->content_type,
>> +				 frame.avi.content_type);
>> +	else
>> +		v4l2_ctrl_s_ctrl(hdmirx_dev->content_type,
>> +				 V4L2_DV_IT_CONTENT_TYPE_NO_ITC);
> 
> InfoFrames must now also be exported to debugfs. See e.g. drivers/media/i2c/tc358743.c
> and include/media/v4l2-dv-timings.h (search for V4L2_DEBUGFS_IF_MAX_LEN).
> 
> This is a recent change: both drm and v4l2 can now export InfoFrames to debugfs,
> and this is handy for debugging issues.
> 
> The edid-decode utility (part of v4l-utils) can parse these InfoFrames.

Ack, will add the InfoFrame debugfs.

...
>> +static void hdmirx_load_default_edid(struct snps_hdmirx_dev *hdmirx_dev)
>> +{
>> +	struct v4l2_edid def_edid;
>> +
>> +	hdmirx_hpd_ctrl(hdmirx_dev, false);
>> +
>> +	/* disable hpd and write edid */
>> +	def_edid.pad = 0;
>> +	def_edid.start_block = 0;
>> +	def_edid.blocks = EDID_NUM_BLOCKS_MAX;
>> +
>> +	if (IS_ENABLED(CONFIG_VIDEO_SYNOPSYS_HDMIRX_LOAD_DEFAULT_EDID))
>> +		def_edid.edid = edid_default;
>> +	else
>> +		def_edid.edid = hdmirx_dev->edid;
> 
> So if you are not loading the default EDID, then you load a zeroed EDID?
> 
> This is much too complicated: if there is no default EDID, then just
> pull the HPD low (you do that already at the start) and return.
> 
> BTW, please check with CONFIG_VIDEO_SYNOPSYS_HDMIRX_LOAD_DEFAULT_EDID set
> and unset and make sure there are no compile warnings/errors relating to that.

Now I see what you meant previously. Keeping HPD pulled low if there is
no valid EDID will work. Will change it in the next iteration.

Thanks for the review!

-- 
Best regards,
Dmitry

