Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9730C87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 12:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ul0VilOygFhHxm/w/hJSXqTGHl6fL3d19lOA7ea522w=; b=dHDGcyvSQhU7PEQwOviQ4fR08h
	h+aZPJerup3YrJKzVMBUXeh9CGbtWCOkxQduicHsi7dXSZW72ix+0I3PXvl87vdzl28TcHpeUjNDz
	3woXqOiMSmyUW+96Pw/OalMEW9eyY/MFoA9HDjqxxGG1tLPEnm6Auhi64NpmU3/Xq75mocNf90Qho
	V3GEdW24XrsukfjV2w0XAr96wSGIKKS9ovOyHdVLGifX1VuFgsYhODvRk6xxYPHrCq55K/HzVvN1p
	AmVBTAoB9Nts2476tUGIOzdszGXoFnTCGJjRG9vzkFfEEekqInWqpdjrlVxkBPotUdyb/0IAkdxJE
	6KzQEulw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufHlp-00000009qsQ-2FpC;
	Fri, 25 Jul 2025 12:43:29 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufHjK-00000009qZS-47qC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 12:40:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 26FB1A564ED;
	Fri, 25 Jul 2025 12:40:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39D74C4CEE7;
	Fri, 25 Jul 2025 12:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753447253;
	bh=ul0VilOygFhHxm/w/hJSXqTGHl6fL3d19lOA7ea522w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B1fcYiMWd8UUMjYMHJ3sJBs+IUVbrWMxopVygBl5CX/gm0Wa50pdhv3FJLSqDSKg9
	 urP2AjiRhmG2i9UyQaXgjsgH9FogZb0TX6nv7eVCKmHP2DN4qizqq0YdTMzFLr0Zck
	 oF0WSwhgbH1FsIE5SLaDPc5CPnYxcpeE/WMfbqSg84op1AOr5gwHEjn7CPnUo8jZPw
	 Uu8emJAcqxMUXSHP0dzocbcUut5ptAjsyakhN61JxTkrhDWnYKCJUgBNJ02Oe79nPt
	 kBOtRPvWxOihVBZOwFF/pUPOZ3MosAc/yuUA5JYBcCrCuCQeCUgrosbXIAKvoMO1CW
	 BKYSoYx1RIXCw==
Date: Fri, 25 Jul 2025 13:40:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Joris Verhaegen <verhaegen@google.com>
Cc: Vinod Koul <vkoul@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Srinivas Kandagatla <srini@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>, kernel-team@android.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com, linux-arm-msm@vger.kernel.org,
	sound-open-firmware@alsa-project.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/3] ALSA: compress_offload: Add 64-bit safe timestamp
 API
Message-ID: <aIN7Szen6rTj9iED@finisterre.sirena.org.uk>
References: <20250725114249.2086974-1-verhaegen@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZMKo0FCzsB8T8s1S"
Content-Disposition: inline
In-Reply-To: <20250725114249.2086974-1-verhaegen@google.com>
X-Cookie: Do not cut switchbacks.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_054055_085088_26760EB4 
X-CRM114-Status: UNSURE (   9.69  )
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


--ZMKo0FCzsB8T8s1S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 25, 2025 at 12:42:42PM +0100, Joris Verhaegen wrote:
> The current compress offload timestamping API relies on struct
> snd_compr_tstamp, whose cumulative counters like copied_total are
> defined as __u32. On long-running high-resolution audio streams, these
> 32-bit counters can overflow, causing incorrect availability
> calculations.

Acked-by: Mark Brown <broonie@kernel.org>

--ZMKo0FCzsB8T8s1S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiDe0oACgkQJNaLcl1U
h9C9gQf/UjGFlwyQlpmpgnGs/Pd4tXQxorttfUMXCyxLLSNovO5hc+4e/OdRD26t
+BeqXAszotkOyV5zn8Xnclb0wTMBFWYtQdP3bJzE2Gev5xwQzYqDTFToBnj1kRlM
CI0wM+dY2bjygZf7LeOr3vxnPcbPrF98aTDHqPJqjdYIkTNoQ7q7sqlqA3iaY2UT
Slu/dqPRWxbd760lKl6PKli8jtNofmBsi1uf/YZDGnA6PJtgvQYRRbaPdzsXoFHr
Pfe0aEtz7R4rGSuCCSwmAwdzpf488LM18F/NYQ8CwWnBilsUNP6yEev8z8qBmHrb
fXraSLkoQFLKBardB7hKfyuaMhwx9Q==
=G4VO
-----END PGP SIGNATURE-----

--ZMKo0FCzsB8T8s1S--

