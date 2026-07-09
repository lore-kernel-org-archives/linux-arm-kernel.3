Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C7A3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 10:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1/g9IC9odOOKLSJ5X43cGRnLu4qzcG9RWG3RGR7ofEM=; b=LzXWzqymKBjtbqaXsA5syzUFJ1
	/6fkRcYTQAjAENCMP+5S0icW8FscTeGwB/sRoWq6R8eR9zpANNtSlYt5l4f9nF4QJIDYNG4qAF+9N
	aqPuObKEiL3fOkUzxKy6nwUtxWRD0p0Lq2nuytKuQ3tKzEssX8jjjQB1bQLg8KbuWrRnfqHcEReJa
	BKkzLQSsCFFtrPhBum6Jss446n/ZYp+LnESmR0fnMkjbgGW1wADlKT1UciYveeSJdBU4UuhR8o9TA
	74DMddcNKoOm2IgjQzEaw8uvIx4e3D7NRpiJ6IiEbJ0oMa84RpJkyh6FfqX1i50i2olI/uTJoBaMN
	oibTyxJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whlnq-00000001v3L-2quk;
	Thu, 09 Jul 2026 10:16:22 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whlnn-00000001v2H-2Z4t;
	Thu, 09 Jul 2026 10:16:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783592179; x=1815128179;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vUyuVhXb5XWOW1lu5ae8NpgTwEcJHaHweC6f6X1cbX8=;
  b=C4i9qXl1Ld6pqkydgykC0omuvagIBNuni3XtdxISCTTS7BwvmQw9md6N
   GcJDWbq5YfC6IjDvr1QfUAGI1xGDoy9w6RgbRCeX8ycx0AD7e4qZzjbY5
   im6gW9bYlZ1hEBP6P4dhW0Kxo2PSpfTNb+TcQenVtx1isTFt5HAAKKQPN
   RYCC4jx1eUYquOw6bdw/3csIKEsiT+lAuxGfvOHbKo7ScDps2od9JClBq
   sjaQw0dN3AYMkcJXxvp8hmmWRIBiflsiXRNyPgs93Yc+AL2x+TtQjT+8v
   O4vmtghCivb8rOHfUkQRPS9/0yBVRwjGIGxfKu6YbwHBo5PmxoAnOmIFU
   g==;
X-CSE-ConnectionGUID: gL6nZzpKQpKmHc80q1A4GA==
X-CSE-MsgGUID: 4bZ5H3TvSu6FLEsVTC5DKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="94916086"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="94916086"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 03:16:19 -0700
X-CSE-ConnectionGUID: nZeE0HBNTiyYL9uGZR4QmA==
X-CSE-MsgGUID: 88JSxELiQ7WNKT7Oj54cVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="254058060"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.235])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 03:16:11 -0700
Date: Thu, 9 Jul 2026 13:16:08 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Peter Korsgaard <jacmet@sunsite.dk>,
	Michal Simek <michal.simek@amd.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	bjorn.andersson@oss.qualcomm.com,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-omap@vger.kernel.org, linux-mips@vger.kernel.org,
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
	aniket.randive@oss.qualcomm.com,
	chandana.chiluveru@oss.qualcomm.com
Subject: Re: [PATCH 0/6] tty: serial: propagate errors from uart_ops.pm
 callback
Message-ID: <ak906CqHYDooQTVu@ashevche-desk.local>
References: <20260709-add_return_check_for_uart_change_pm-v1-0-e85c6ffa8ec4@oss.qualcomm.com>
 <9320a573-ebf8-459b-a313-3a8b73a6180b@kernel.org>
 <5eecf3a0-b608-4057-b400-236f6952b380@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5eecf3a0-b608-4057-b400-236f6952b380@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_031619_685622_3938C227 
X-CRM114-Status: GOOD (  12.07  )
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

On Thu, Jul 09, 2026 at 02:22:17PM +0530, Praveen Talari wrote:
> On 09-07-2026 12:23, Jiri Slaby wrote:
> > On 09. 07. 26, 8:25, Praveen Talari wrote:

...

> > OK, now I miss the rationale behind the patchset. Neither there is a
> > possible code path to actually test this?
> The rationale is that qcom_geni_serial_pm() calls
> pm_runtime_resume_and_get() which can fail, but its return value is
> currently discarded because the callback is void. 

So, you take the solution from a wrong end. Just get rid of .pm() in your driver.
With that, problem solved. Really, this series is a road to even more broken
PM solutions.

-- 
With Best Regards,
Andy Shevchenko



