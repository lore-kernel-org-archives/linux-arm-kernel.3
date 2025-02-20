Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5EEBC021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 14:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HI0x1V5vmdZylGW+OdW5rydDfy7k4GZBwl1UagyB37A=; b=QUgxNa6/+Uwt5GtutNRI7HjveT
	3Uv9EA8yAzHG52KGo3U3KUjuyFtZ+DgHw5l7QyZbannogFPJ7eRQPHhgtpMN6BtI3yLYoYFx1+JN7
	X93yL3ZbH5gcU6+vy8Ged3ZWmN6RJXB+3WsWPdWxz4l9kLbncpRSmmw0az6U6ZJFDjIH5wQwfAVV3
	nc/tZ9uXicXN1w54ovYDNQVKkx5pTNiDGgsXl8YT6kY0WWjJhgamgLjmevXfW4+BuTMCibf9HZO8c
	S2I5D3l17R/CdLQO4/UI26PeA2jml/EPRlKdveBGcEPt2+YO5qGUSHh1fLmG3cFNz/py1jJyw25Fz
	WsqD8tfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl7JO-00000001FIH-2dTx;
	Thu, 20 Feb 2025 14:13:58 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl7CL-00000001DLY-0Loi;
	Thu, 20 Feb 2025 14:06:42 +0000
X-CSE-ConnectionGUID: yZ9MDWrZTQ2E9JFMGNFCvA==
X-CSE-MsgGUID: QGBpKbQ4Q3iiF4KkSWCSgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="44488640"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="44488640"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 06:06:39 -0800
X-CSE-ConnectionGUID: 6degz7rJS+W0Ozne9fsEcg==
X-CSE-MsgGUID: cwOP4iibQH6/Nq+7aviA4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="115028702"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 06:06:35 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1tl7CC-0000000DM0r-06C1;
	Thu, 20 Feb 2025 16:06:32 +0200
Date: Thu, 20 Feb 2025 16:06:31 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/3] media: cx231xx: Convert enum into a define
Message-ID: <Z7c252IKhXdysjAi@smile.fi.intel.com>
References: <20241202-fix-llvm9-v1-0-2a50f5acfd0b@chromium.org>
 <20241202-fix-llvm9-v1-1-2a50f5acfd0b@chromium.org>
 <20241203093114.0ca49c01@foz.lan>
 <c896221c-5ff2-4a2b-b431-7c7f805b4f68@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c896221c-5ff2-4a2b-b431-7c7f805b4f68@xs4all.nl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_060641_154956_FE1E12D7 
X-CRM114-Status: UNSURE (   9.52  )
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

On Thu, Feb 20, 2025 at 02:55:42PM +0100, Hans Verkuil wrote:
> On 12/3/24 09:31, Mauro Carvalho Chehab wrote:

...

> ORing enums is really not a good idea: you would normally never do that, and

I think you missed a keyword "different", so "ORing different enums ..."
which I totally agree on, but the same enum values are fine.

> the compiler warning is IMHO appropriate.

-- 
With Best Regards,
Andy Shevchenko



