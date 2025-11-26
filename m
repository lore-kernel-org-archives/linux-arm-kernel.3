Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 395D1D1118A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 17:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JIATeLLHFUQMl6oNTOwv/zu2OSZhFjRfKgrLqLFKVso=; b=2up1npwne/p442r1LoVyRbtV5k
	MEyAj9hxyhNJGbzmmEtpebVRuVxXTBh+So6WzTJb7I9w4Bi1RjXFeJUgPUiFSIrADAVOvQO8KEmBZ
	IZDwHRRjFcBN9vzptCdjBlAUNiAnwSs4KtN/HxLmjt6OQ2DRkPb/XJ57waXscZ5SD4PKVVUWk8B6+
	cw4q6jhx2JbU2D3YhprJWvgDw7iicvhIQOrQEzxvYWqGKzixthLhqR50UgiKM5cw8JA0y2Y0HR/DD
	sQbw1g9ofGBzSTNZL+mCi0QRqm9gmxtXZvL2dDYfwMgPta6Vxijb1hx5Vc1iajX2x/48x2WU5XU8G
	bYKZxWKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOJAB-0000000FNcr-1jTM;
	Wed, 26 Nov 2025 17:18:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOJA9-0000000FNcT-3G6X
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 17:18:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2621C401FE;
	Wed, 26 Nov 2025 17:18:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5784C4CEF7;
	Wed, 26 Nov 2025 17:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764177521;
	bh=QNpZf3xUex3YCkCt1bo+5+Se1H+g3kaaOupJjR57dYs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BHor0WDvsu5cCGZ1MM77lOYKzwX+hbRxkuaEXcL4019i0PaMKsd3bqxDwrrzDaQbb
	 K6+Gm2jD0vhvIHIW60L7Sw1iLEMhnB9NlxEKOr3eQHzjmo4GAk0kX8lRXndMVB/qdV
	 yUeFFG1dNicKXHyOiH1f2lx4pNyisGTsVEAPo7SRAkPEQlrbsh+opctTnQc5yYRloa
	 BQUXa/PrpdBzWI6iDu2XagLLQzk7lH+hi4riT6+c9I6fm2cOYIMLKcffik434bQO2N
	 j+Q62yza6zPdMoNkqUeFQm3uFpRn13I+iL+ObWlX8TK/R65xVGwXaqe+20Q4gCtQ2b
	 /hT+PcTGi7VTw==
Date: Wed, 26 Nov 2025 18:18:26 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Yan <andy.yan@rock-chips.com>,
	Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>,
	Konrad Dybcio <konradybcio@kernel.org>,
	cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Moritz Fischer <moritz.fischer@ettus.com>,
	John Stultz <john.stultz@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Stephen Boyd <swboyd@chromium.org>,
	Andre Draszik <andre.draszik@linaro.org>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	Elliot Berman <quic_eberman@quicinc.com>,
	Xin Liu <xin.liu@oss.qualcomm.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Umang Chheda <umang.chheda@oss.qualcomm.com>,
	Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
Subject: Re: [PATCH v17 07/12] firmware: psci: Implement vendor-specific
 resets as reboot-mode
Message-ID: <aSc2Yh3AvLXOBvcz@lpieralisi>
References: <20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com>
 <20251109-arm-psci-system_reset2-vendor-reboots-v17-7-46e085bca4cc@oss.qualcomm.com>
 <aRIfc9iuC2b9DqI+@lpieralisi>
 <80e68e44-a8e0-464a-056e-9f087ad40d51@oss.qualcomm.com>
 <aRxmWrAkD0Vu4pF+@lpieralisi>
 <1da024e7-efb1-3a1c-cc13-0ae5212ed8bd@oss.qualcomm.com>
 <aR2P4CxQNebac6oU@lpieralisi>
 <682b1a0c-644f-2aff-1860-cbf9a53bc62b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <682b1a0c-644f-2aff-1860-cbf9a53bc62b@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_091841_860709_8E38BB8D 
X-CRM114-Status: GOOD (  23.66  )
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

On Wed, Nov 19, 2025 at 05:32:42PM +0530, Shivendra Pratap wrote:
> 
> 
> On 11/19/2025 3:07 PM, Lorenzo Pieralisi wrote:
> > On Tue, Nov 18, 2025 at 11:11:33PM +0530, Shivendra Pratap wrote:
> > 
> > [...]
> > 
> >>> Yes this could be a potential way forward but that's decoupled from the
> >>> options below. If we take this route PSCI maintainers should be added
> >>> as maintainers for this reboot mode driver.
> >>
> >> you mean the new psci_reset driver? yes. Maintainer would be PSCI maintainer,
> >> if we create a new  psci_reset reboot mode driver.
> > 
> > Yes.
> > 
> >>>> - struct with pre-built psci reset_types - (warm, soft, cold). Currently
> >>>>   only two modes supported, anything other than warm/soft defaults to cold.
> >>>> - vendor resets to be added as per vendor choice, inside psci device tree(SOC specific).
> >>>> - psci_reset registers with reboot-mode for registering  vendor resets. Here, we
> >>>>   have a problem, the pre-built psci reset_types - (warm, soft, cold) cannot be added via
> >>>>   reboot-mode framework.
> >>>
> >>> Why ?
> >>
> >> If we want the new psci_reset to take the reboot-mode framework route, is it ok to
> >> add default modes (warm, cold) in the device tree?
> >> If not, then the design of reboot-mode framework(power:reset:reboot-mode.c) needs to be
> >> further changed to equip this new feature. 
> > 
> > Well, yes, all it needs to do is allowing prepopulated reboot modes on top
> > of which DT based ones are added.
> 
> The mode-cold , adds a third variable to reboot-modes as the first parameter for 
> invoke_psci_fn is different for cold vs warm/vendor.
> 
> cold reset call       : invoke_psci_fn(PSCI_0_2_FN_SYSTEM_RESET, 0, 0, 0);
> vendor/warm reset call: invoke_psci_fn(PSCI_FN_NATIVE(1_1, SYSTEM_RESET2), vendor, cookiee, 0);
> 
> Each mode will have 3 argument - like:
> _ _ _ _ _ _ _ _ _ _ _ _ _  _ _ _ _ _ _ 
> MODE   , cold reset, reset_type, cookie
> _ _ _ _ _ _ _ _ _ _ _ _ _  _ _ _ _ _ _ - 
> COLD   ,   1       ,    0      ,     0
> WARM   ,   0       ,    0      ,     0
> vendor1,   0       ,0x80000000 ,     1
> vendor2,   0       ,0x80000010 ,     0
> 
> So reboot-mode framework will now define and support upto three 32 bit arguments for each mode?

The cookie value is unused for SYSTEM_WARM_RESET, you can encode there whether
it is a cold (SYSTEM_RESET) or warm (SYSTEM_RESET2 - SYSTEM_WARM_RESET) architectural
reset when the magic value(aka reset_type) == 0x0 ?

The reboot mode parameters do not necessarily need to map to PSCI function
calls parameters - provided we define that explicitly.

Lorenzo

