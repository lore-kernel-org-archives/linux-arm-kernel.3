Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBBF5C61DC2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 12:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mI7Ir8cW1HZGzrJ3IgYTBV4C/vSt21EnGOEbcNn3KgE=; b=bIPpMlhHRt2HRLBOn9YMrxK4PO
	RbtdW4t8p1ab55k4dL+911aIOoH96Nsjg5E2JK19L1qQwfSOlTLwLtDk9jCqdSKU865PQD2R0FneM
	3L2W0v/grwhPJf5/YomIQMNhFFhflZKqygqyYw0ldlww3zOSNknKd7pc36VV6qZ/CkszwiQ03Iu8t
	/5vZS9ktLBbP/7PwBL9x+QWnJTGqrdwQzB68sy4NJ56T0paeU7u2kDRbcPeVejGXNZG0/z/VlBlEG
	prrb/OsyLytVpDKro987j0zcyvoHe/XFo7yYoAPrjpI8M97ZVLCJy/MNVNOmE3qZ0/LCvtuWgN5z5
	1vkP+v6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzZ7g-00000003xHG-16t8;
	Thu, 27 Aug 2026 12:22:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzZ7e-00000003xGq-3bBH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 12:22:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9B9DC435EB;
	Thu, 27 Aug 2026 12:22:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E46901F000E9;
	Thu, 27 Aug 2026 12:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787833342;
	bh=mI7Ir8cW1HZGzrJ3IgYTBV4C/vSt21EnGOEbcNn3KgE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DHiOqh7Hc6UidV5DQSHUCuyQPRlT/1LcmtoaXOCgWNw3pwfOebHtmVjEWg03TFJl9
	 /ibWFHUAwgyIbj1XBYsfyQUfMGF/o7hLcWVRrgrotr2JbHmhyTt5qh+J8LrIZSJnUB
	 ShBey9nkwPM/fBCare/ty51WaL3wGiNJxg32piZilWMf6f+4e7t2PVm+LqVevgxsgR
	 D65rGuNiiYDYTBjD+Th2JBoDt7Wudemp5/dFJcUu5sS3xBWCQqKahy4UuKmhgaHKeR
	 M/FO/3gLgHBTWuHbUFUH7RBKvitxshy4w0z67OYYazfIHX1LlnTjXP2ze6lkOa5Js0
	 moT1GDautIEZw==
Date: Thu, 27 Aug 2026 14:22:18 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Taniya Das <quic_tdas@quicinc.com>, 
	Georgi Djakov <djakov@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 10/15] dt-bindings: clock: qcom: Add Kuno Global Clock
 Controller
Message-ID: <20260827-tiger-of-sublime-flowers-eb8f90@quoll>
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
 <20260821-kuno-soc-support-v3-10-196e2b306368@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260821-kuno-soc-support-v3-10-196e2b306368@oss.qualcomm.com>
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

On Fri, Aug 21, 2026 at 09:39:03PM +0530, Hardeep Sharma wrote:
> Document the Global Clock Controller (GCC) binding and associated
> clock/reset IDs for the Qualcomm Kuno SoC.
> 
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>

Sashiko comment was not answered and looks reasonable, dropping from Patchwork.

Best regards,
Krzysztof


