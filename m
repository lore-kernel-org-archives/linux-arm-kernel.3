Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1459E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 17:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ik3QLw9UGMKnxPg4l01yFX/0oyq1X9s68T58mzM5ads=; b=oJROiWe4cdY0uXG0Tf3/nNcNZH
	wN8XHB5uvH3pIZxbRfscLII/YPq8txeJ/FHcMkToP8vk4sOMDrZ4RMcfEoVE8Zr+T6RzFhab42eLQ
	hEr3uEnmo/s6lUcX+Y9HwHLIEMYxNhdRuo962buIRqPZsV1ssdF3RDNKqMhucgdYOb9A2tBTwk+1K
	UiVIgrU/RwGuzPvJ94iIJD927cKeGh6pvol5IG5v90CE4yIHTeZenAkijMCz/GnNFIa3XBl9DCavg
	O2IBfee8rWXdTZ0lhJ58GAn8tFXQCZxmXbTwgUgZ9vw47iSQB9sfo3iKoYNHJ/sJGW/YrMChoZa+B
	4t7FpeMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tItXt-0000000DRoR-0rB4;
	Wed, 04 Dec 2024 17:52:17 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tItWr-0000000DRSH-434j
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 17:51:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733334674; x=1764870674;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ik3QLw9UGMKnxPg4l01yFX/0oyq1X9s68T58mzM5ads=;
  b=JZOzm+X4nivyNIDJkEremS2ctfmMCB7PqDMVC8MMvfDKcYVaAhoJzfBS
   3OxqIhC/8UVOpN36vaNWUXXPBxODxk3OObTgy+cI0v9cEStZ5rz+u+Mzh
   9xO34GzrhPU4aHNfwWnYuVxcnqya6FIOh7wnMbSICUyvKHGAvqS/jTqzc
   WqP9IcOUdveD1NUJl2BeTi25v25EigYTO8p13wNF8M9aIGvjmvdlBIzgV
   PDdF8PxNILz5bxVMI/Tqh3gG4BZnc0APwRmnLjJpfsqvtEvuIHvEJg+I7
   WuuL+V8I5nSuo/CgLXssvQvq0mdC51L/a+zpSRsJqZXBtGDngDwqXe5Yk
   A==;
X-CSE-ConnectionGUID: IcqLN6qgTb2NW44ygTCHyQ==
X-CSE-MsgGUID: zsX06L9WQ3G7NtyAVRLs2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="37392174"
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; 
   d="scan'208";a="37392174"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 09:51:11 -0800
X-CSE-ConnectionGUID: lPqKmV1BT4eeE13DlFLk8Q==
X-CSE-MsgGUID: ImJp8lYITJ6+VecW9ZGo8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; 
   d="scan'208";a="131283575"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2) ([10.125.108.58])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 09:51:09 -0800
Date: Wed, 4 Dec 2024 11:51:01 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>, 
	Alex Deucher <alexander.deucher@amd.com>, Simon Ser <contact@emersion.fr>, 
	Jeffrey Hugo <quic_jhugo@quicinc.com>, David Airlie <airlied@gmail.com>, 
	Hamza Mahfooz <hamza.mahfooz@amd.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, 
	Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, amd-gfx@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, nouveau@lists.freedesktop.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 3/3] drm: remove driver date from struct drm_driver
 and all drivers
Message-ID: <lf2kh3f7wr7nd3tsuq4p2eppiizveqb3mm6z7bfw7a47hj4hsy@u6hybopsg6bl>
References: <cover.1733322525.git.jani.nikula@intel.com>
 <1f2bf2543aed270a06f6c707fd6ed1b78bf16712.1733322525.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <1f2bf2543aed270a06f6c707fd6ed1b78bf16712.1733322525.git.jani.nikula@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_095114_042030_A750745A 
X-CRM114-Status: UNSURE (   7.91  )
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

On Wed, Dec 04, 2024 at 04:31:12PM +0200, Jani Nikula wrote:
>We stopped using the driver initialized date in commit 7fb8af6798e8
>("drm: deprecate driver date") and (eventually) started returning "0"
>for drm_version ioctl instead.
>
>Finish the job, and remove the unused date member from struct
>drm_driver, its initialization from drivers, along with the common
>DRIVER_DATE macros.
>
>v2: Also update drivers/accel (kernel test robot)
>
>Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>Acked-by: Alex Deucher <alexander.deucher@amd.com>
>Acked-by: Simon Ser <contact@emersion.fr>
>Acked-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
>Signed-off-by: Jani Nikula <jani.nikula@intel.com>


Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

