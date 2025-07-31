Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E50BC87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 10:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xxk1GEBxgt7Wq5m0JMo2E8p/OXKtwtzOI0AI4QbYiho=; b=QRwMjGlo/SPP1zVZ0P7wsY/MUs
	LhBwjlV0LVZdcZqBaTqe/SbhCy2UUkDYWCXfymTwQkpBOvjPYZxC00C7K/KvKMDgjH2xHsGqTlaH+
	uSYfkkX/o+bIxTek++78EW0fVmPTZ47PXSpEqrizdYoYK2qeLsxXlZx/v+KJN1plkxhwLLhHJ7eY+
	sq1hIhZgcamPkFXdbeJs822Ib5KSmT9+EmKAf6E1STtlrQ+01GUaByjDb0uBtqhqAtONzhazT6mBt
	WmS7oUe/07BLWc8YMR8p1QXCrvBrvvqV+ZxEFVTzTRr4pygHt34pbI6fA5JD9hxgDgN4ki3nhq1HQ
	uJGe8spA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhQMt-00000003Lx3-401N;
	Thu, 31 Jul 2025 10:18:35 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhQKD-00000003LjK-3gfr;
	Thu, 31 Jul 2025 10:15:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753956948;
	bh=RJiuaDp9mWdvOO/DBR0WGEM4OUuHTFOlawmLNB3P+G4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=njKKHKIzlvWFgIIXcjpz+iskyPm9MiUUMKAUvxUtiG1R1CgxIxZBHbJjZBHW5uq3u
	 jiKMiAau9Fc3+HFgb86VauHp12rel7f8aFYebPkZHci0x0Q4agt18ckSKOTwDUSiXb
	 naWk8UpG8LvfB6reJg+U+S8i3x6yNwU06vqxE3Kyj96t372JvbxtEv/FS4iQrpm52A
	 vdIHItdj2KWjh0XbwNH5BTVLH4H5lanquQcnsqIyYj2ZbiVAP0rTJRA1kwIUkRMD4m
	 Q1HrtCVCOmc4oY9mqSYISE9uT3ccecOvDRfl1rFvwg8v0pC2d75f+fEShZd3VCvuCk
	 ohEj4DvNj4y8A==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:e229:d0be:3141:7dd2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8432E17E05F0;
	Thu, 31 Jul 2025 12:15:38 +0200 (CEST)
From: Laura Nao <laura.nao@collabora.com>
To: fshao@chromium.org
Cc: andrew-ct.chen@mediatek.com,
	angelogioacchino.delregno@collabora.com,
	arnd@arndb.de,
	bchihi@baylibre.com,
	colin.i.king@gmail.com,
	conor+dt@kernel.org,
	daniel.lezcano@linaro.org,
	devicetree@vger.kernel.org,
	kernel@collabora.com,
	krzk+dt@kernel.org,
	lala.lin@mediatek.com,
	laura.nao@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-pm@vger.kernel.org,
	lukasz.luba@arm.com,
	matthias.bgg@gmail.com,
	nfraprado@collabora.com,
	rafael@kernel.org,
	robh@kernel.org,
	rui.zhang@intel.com,
	srini@kernel.org,
	u.kleine-koenig@baylibre.com,
	wenst@chromium.org
Subject: Re: [PATCH v2 6/9] thermal/drivers/mediatek/lvts: Add support for ATP mode
Date: Thu, 31 Jul 2025 12:14:41 +0200
Message-Id: <20250731101441.142132-1-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <CAC=S1njcFhyY6+dT2MHU02ZsLDq+k_vAVv==bWuoGt3KA18PHg@mail.gmail.com>
References: <CAC=S1njcFhyY6+dT2MHU02ZsLDq+k_vAVv==bWuoGt3KA18PHg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_031550_073949_6A45A64B 
X-CRM114-Status: GOOD (  15.26  )
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

Hi Fei,

On 7/31/25 06:25, Fei Shao wrote:
> On Wed, Jul 30, 2025 at 11:40 PM Laura Nao <laura.nao@collabora.com> wrote:
>>
>> MT8196/MT6991 uses ATP (Abnormal Temperature Prevention) mode to detect
>> abnormal temperature conditions, which involves reading temperature data
>> from a dedicated set of registers separate from the ones used for
>> immediate and filtered modes.
>>
>> Add support for ATP mode and its relative registers to ensure accurate
>> temperature readings and proper thermal management on MT8196/MT6991
>> devices.
>>
>> While at it, convert mode defines to enum.
>>
>> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
>> Signed-off-by: Laura Nao <laura.nao@collabora.com>
>
> It's not visible in this patch, but a heads-up that I see
> lvts_ctrl_start() also depends on whether lvts is in immediate mode. I
> wonder if anything is needed there for ATP mode e.g. a new
> sensor_atp_bitmap.
> Feel free to ignore if this is a false alarm.
>

Thanks for the heads up - the bitmap for ATP mode is the same as 
sensor_filt_bitmap, so the function is already working as intended.

Best,

Laura

> Regards,
> Fei


