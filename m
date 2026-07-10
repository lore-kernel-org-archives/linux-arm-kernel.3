Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F7DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 10:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8h7oqU5VrbSxzMabjyrEsZfFX/tU8T/jpuFUiUgSMj8=; b=owR5oLeUNBTenj9dHJlxVKcSD2
	hzDvBu5jkMGpFjGeFPYmAtYSPIchm7jl4d+6qAyVqOA6Ey+VXnKwekjYvzxnd2vrXCiQ+JMLBb+B7
	mTMaJyAmNUetXzMYarJ5V1fVd7XNmfn72uK8PegewuVdvmG4EV2Rgfv8lmML655ZqsjbRduza4xzO
	r74n93l6j+XAeN6ZGG1WR13fNru5UOl9StmbObO0petGNsmtew0WLR4gc4hssiVKqAznylPUCWTG1
	PIqoo/2x+3Y/VK9cVvJbKO3v2Zyegi7MoDXAayxsq5t68Jw0pbVcYyrw6kmVytzMcQj5S3HjM9kb6
	wUgrsNeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi8Ma-00000004grZ-0T3Y;
	Fri, 10 Jul 2026 10:21:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi8MZ-00000004grI-0YZm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 10:21:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A50F242DDF;
	Fri, 10 Jul 2026 10:21:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C57251F000E9;
	Fri, 10 Jul 2026 10:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783678901;
	bh=8h7oqU5VrbSxzMabjyrEsZfFX/tU8T/jpuFUiUgSMj8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LkrgFSkndzJ/SFPA+4AIzFpW4hbJopqU6uGT/fWHqtusJv4WlDihe1NYGHYkDuMsY
	 f4pxfLrC5eyxf18xnDiKEqdyLRNq3Cs+m3UA/eR7SfuHwvZNWzlBLxArTfXMnfjsUp
	 oXKmcrgYrLMO7oTps7t3Wa3qZ7j6ffYAxNJiRgRkSxqorms1GQyturavm3n0sMBAJD
	 oXrCUP3bSfKEtD5QpHAgh0jfe7nPbFmiiq0i0Nu99iQzg+dXqx9lSahoOIxFrhtSq9
	 WTjj9L1/duTwfIPnMcQ+8fkKDkwvMbWZHSiu4KFaOqNfqOTsMmhQ14A3BhRldKIIby
	 oSpOZqUZapKfg==
Date: Fri, 10 Jul 2026 12:21:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Kevin Hilman <khilman@baylibre.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 05/10] dt-bindings: clock: renesas,r8a78000-cpg: Add
 firmware property
Message-ID: <20260710-adventurous-burgundy-chimera-b2fff9@quoll>
References: <cover.1783505329.git.geert+renesas@glider.be>
 <49726acff0fee1c3606e83c4f242ef6aad25b4b8.1783505329.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <49726acff0fee1c3606e83c4f242ef6aad25b4b8.1783505329.git.geert+renesas@glider.be>
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

On Wed, Jul 08, 2026 at 12:16:23PM +0200, Geert Uytterhoeven wrote:
> Add a firmware property, for systems where SCMI must be used instead of
> direct hardware access.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - Spin off from "dt-bindings: clock: Document Renesas R-Car X5H Clock
>     Pulse Generator".
> ---
>  .../devicetree/bindings/clock/renesas,r8a78000-cpg.yaml    | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml b/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml
> index 4e23bba334382346..fc499e7cf52e4f0c 100644
> --- a/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml
> +++ b/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml
> @@ -35,6 +35,12 @@ properties:
>        <dt-bindings/clock/renesas,r8a78000-cpg.h>.
>      const: 1
>  
> +  firmware:

RPi is doing similar, but I have doubts. It looks way too close to
generic "syscon" which is disallowed.

I think this should be vendor+purpose specific, e.g.:
"renesas,scmi-transport" or "renesas,scmi-firmware"

Also we have "firmware" nodes, so this might cause conflicts in dtschema
validation.  Anyway, the phandle itself is fine for me, just the naming.

I'll ping also Rob to chime in.

Best regards,
Krzysztof


