Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C01FCD3B98A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 12:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6dtE9rj6gMSXXf39reUm950KsYI1mL6ukDFs2aqzXTA=; b=p6YXtxkOreC4M+CsuCvm1jVEtL
	EZz3EV9M9KZSD7X1+5A0HDueobs2b7ga8Ioe0GK9tq7SpEQSnB/dnQUCMD5dtozrSrl4PrPEiyzLh
	aJVHa/fW1mgB68nrhjj89vxF/+JRJOh6U2HD9TZT39xEP4k9PKAyszAJfDNTeymAOvyw6141i+C7c
	6HZCmpV7Ta+CjEVUyndB3RKKjHYxfgtz/PhewsoLeYw0vKgi0J21a5vMwT5NCWMokQNsV7HlO1PX/
	7yHoP/W3Myx0O/nji0b4In1XkYtPgnz6q5WSbkHw+ORAQ+e9cEHpvVNaZ7/AIxPko4Z4rKTM2NR27
	7qJMuYAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFudB-0000000AZLE-46kQ;
	Tue, 26 Nov 2024 12:25:25 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFucD-0000000AZFk-1kJV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 12:24:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732623866; x=1764159866;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=ZTHfXgFGRlIILfuHL+qBGlAm9C8PxmMo8Z9AFzfvBdw=;
  b=F0HBOkzQkJSrDhO90D6d/gRwwf7ECoSPe3GjMYzjI/df5Tabsxu06+31
   cVRrJuptMz3XuoqwcZcgUCLwaY6TeXxd6/1VbQmNo8kewv97+6mOJCLPp
   BOxWD+e6bd1oPX5DX6raQPHJqmc3DnhfJyURd56+1M2wJd4Eg1Td82g9y
   oFyonlx8+ZR+rTDNSeCHjtJMtJ5gRacl2IIlSk82KRBYzc68gxHsHI9nG
   4GeXbs8GCDY3j2EoQXIUwIfOdcPB3yNfaXuHjoBNNqJpXrmMJJodxqUXE
   agqHvUGbSbOHGYx3NBI+sinbOi2BwKZ8MHW0gUIMDB4fIa5FCizSWG2gN
   Q==;
X-CSE-ConnectionGUID: uv/Z/3tTT9GKPYbK+pqvxw==
X-CSE-MsgGUID: lbj5y/YfS2adnRMIvi2BkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="55278920"
X-IronPort-AV: E=Sophos;i="6.12,185,1728975600"; 
   d="scan'208";a="55278920"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 04:24:22 -0800
X-CSE-ConnectionGUID: p7mmBzIqQaSRBB7X5+uHcw==
X-CSE-MsgGUID: wzxtY/mSSE24Fp3vXFkb0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="96661073"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.49])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 04:24:15 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Sean Nyekjaer <sean@geanix.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Yannick
 Fertre <yannick.fertre@foss.st.com>, Raphael Gallais-Pou
 <raphael.gallais-pou@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 1/3] drm/modes: introduce drm_mode_validate_mode()
 helper function
In-Reply-To: <20241126-spry-wildebeest-of-cubism-da0a9e@houat>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241125-dsi-relax-v2-0-9113419f4a40@geanix.com>
 <20241125-dsi-relax-v2-1-9113419f4a40@geanix.com>
 <20241125-gleaming-anteater-of-perfection-42bd2b@houat>
 <874j3uxptp.fsf@intel.com>
 <20241126-spry-wildebeest-of-cubism-da0a9e@houat>
Date: Tue, 26 Nov 2024 14:24:12 +0200
Message-ID: <871pyyxjwz.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_042425_485303_3D52B00E 
X-CRM114-Status: GOOD (  16.59  )
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

On Tue, 26 Nov 2024, Maxime Ripard <mripard@kernel.org> wrote:
> On Tue, Nov 26, 2024 at 12:16:34PM +0200, Jani Nikula wrote:
>> On Mon, 25 Nov 2024, Maxime Ripard <mripard@kernel.org> wrote:
>> > I wonder about the naming though (and prototype). I doesn't really
>> > validates a mode, but rather makes sure that a given rate is a good
>> > approximation of a pixel clock. So maybe something like
>> > drm_mode_check_pixel_clock?
>> 
>> Quoting myself from a few weeks back:
>> 
>> """
>> Random programming thought of the day: "check" is generally a terrible
>> word in a function name.
>> 
>> Checking stuff is great, but what do you expect to happen if the check
>> passes/fails? Do you expect the function to return on fail, or throw an
>> exception? Or just log about it? If you return a value, what should the
>> return value mean? It's hard to know without looking it up.
>> 
>> Prefer predicates instead, is_stuff_okay() is better than
>> check_stuff(). Or assert_stuff() if you don't return on failures.
>> """
>
> Both is_stuff_okay() or assert_stuff() return a boolean in my mind. If
> you want to return a mode status enum, I don't think they are better
> names.

Most functions returning enum drm_mode_status are called
something_something_mode_valid(). Not check something.

BR,
Jani.


-- 
Jani Nikula, Intel

