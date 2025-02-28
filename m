Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D629C282D0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 17:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qFyTk6UI9vQkUT0Y0SbdN5aOZAMFszIFkYavvczvjdM=; b=cwaqS/dv1KpIgoqoG0AHx6Nde5
	s1T7P27XBIPypslFpZZ8IdcY+4FzqIxEovffeDRkGsAdDauVyU8yvDDHGhULy8Xo1xp3O/TQyhrD1
	fIGh24nu4C00T7QQxYAoL+iGLIFA7oKPiHiV5gFkRU2eb6A48YRTrSYiOsqc7ZW/9P6s+LAHvk06L
	W96EtCyO8peecxZs5v25JOhoylBJ9qS+1agmBp7lAuYmnnyFKubA+eQB6OdDo03P0n0GYiHDIu6Tt
	J6YqpGH7KmeuKE1BjqR7dbLUYSCcqwWWdfxy0wGdnophy1oKypvme4sCOD7xkNwxsGZtjc+bwJszD
	FMHCJwPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to4J7-0000000BzDK-17vu;
	Fri, 28 Feb 2025 17:37:53 +0000
Received: from mout.web.de ([212.227.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to4Fs-0000000ByaG-06F5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 17:34:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1740764030; x=1741368830; i=markus.elfring@web.de;
	bh=qFyTk6UI9vQkUT0Y0SbdN5aOZAMFszIFkYavvczvjdM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=OI3GlODT7nu2SWH5SZy83uUVQU8+5tFb7uB4py2fClEPknvKBpuS2PfOyDKWB0er
	 BZKTUlQmtYwhjjAK6OFptGcTO9qO6kc1BAtsKWoL9AapFWvRN+UhcORdpUdULxPXd
	 2veGeKFT5rRqljtUPCNBf9iIMLBGda+HmRgfFFEg4qcMy7XlnKOgy02GV3HYskvsf
	 aIitWWKNug7hIcurV1ua/qbGqHVSGOPI3lu0dfT07t2rSnSaW44Ru+mCV7ieZO+cP
	 SRCM+oLEvRQR0vLAz65GSRLRiA2VxUfLJMwhNGdmIkBmPPNg7MxmIvsaZ0doh5L1Y
	 WUr7g7jKMALPJbk0Lg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.27]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MKMA1-1tZz4D0ku7-00KqlH; Fri, 28
 Feb 2025 18:33:50 +0100
Message-ID: <8b046033-0f97-49e0-afdd-a3a3a3c23ec4@web.de>
Date: Fri, 28 Feb 2025 18:33:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 David Airlie <airlied@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
Content-Language: en-GB
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Qasim Ijaz <qasdev00@gmail.com>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] drm/sun4i: dsi: Simplify maximum determination in
 sun6i_dsi_setup_timings()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lA+yt6XQXGbHJA8i/dPHH3qngpTXFeGZNQWLvKtVckTh6A0dFKR
 VvIKo0ilo4K7DBjZeXE4QoS4qwWtxJPnmt0+dUesQA0s5PJMlJP6zleg1N54VKHLbJTKQha
 HiudkuSGSYTNxDpWe0Xla/n+IJxm8E7UcxoeMqX3F1547PEFeOQFUfV7ixoOQH0wJn1/NzA
 /JXSU0t61PkVg1S59unew==
UI-OutboundReport: notjunk:1;M01:P0:8JS2gQELrJA=;gJeX7bdK3jHXeCd39Zg45iaR7Gt
 N5Rje24aQ61qqxH+g1IjROCZuJF4VscVGomPjF61aogbFXUU28SeHsRqyv3FWDWeXvDUjNIni
 vt/ccojul41zlduG8GlSXJ2Q1339FKuIcQDAkNlRuzi7jSE5oOHfKCYs7gxxdW96wAGg3w1U+
 Ihx+okmz8+lNa5uvwVb2GB4KBeRWLgvDaCaJe1IzDvc5Dy+swyvwDnGHFpBqEP76xFNqQgSxK
 Dft1doLFmwj12LXzNU1sXa5Yn/5ToilbzQFiwVrJzIc3oh3RmXqCbZtiXf55rT+l0p48xGEDH
 0qTuiwNhMfDrFUQV1S2ohAScQY4Yy8cNBYaDUtvuVklWkzJsaTG09Ld0tsNSFpgUK2OEQMBSH
 dz8g4QMOEnS6jTiXYbF+gQFchy2N8V7OY/fpr1QJpdcQyp5oT1yido+VO2JEhuwTw06iofq6h
 OlO0nylfacgE/Xy/uWiGHXUXUuaEbCQcRerbpieWv1MeW+NFuvl53F7TCma+Qt7J+EDUVoQp5
 Oo+rNropgVEn2fI4Ls1vN3D4iif9JWl2Y093cnc4a/IfTyw8gG3p2KALcYz9ERYdB2vuA/Ex4
 n0EMqsc9kwgKl4X6uDoJOuUsdf3slrEsOgJordmfY2qZQT7/ky4UQ6OqU+EYSst/yCTDco1co
 jWMAr0+XnrF5MOb8jvYpC4Afe9IpdmqOboSISsM2M4Ru1j3nnj6kZa/UNJgKDT0kOfTfL3KfO
 QVopsnd8fGgUWI17zRBv9WxYhtoJ5SC15o392Xuzbk+oV+jyZKK+FJoBa8j+IzujDN1u1VmgL
 DNbBpWckDYzVJkr9TTV1QH/w1OrixRWlrOTEiUNZfnttY5auDCFgxQ/uglCYjagPdcgKZ2vu3
 9CxWBNeoWJCj9SKvVU+iNNoQTF1lbx/eRYffs3qrO7P0Y/B0pSSmaN5sFmO2tFLq/vd0r8EBq
 XC0XJ9JQdZuLSQTVopmNyawcf7Y7whf00c/xOrHUz6mbxyVJGjlVQ5Qo2kqOiKNuOA7OKWXep
 /Av8XdIYOcGfyYJTPY2BZTRbEmMG4Ub6Bcf1jH+07aDIJ9uGRc20rrp+/cORxBhA3/28uqAHn
 QfbvPnNyq4ezBG4Q5QS4MLmldlAp9xURS4jRM2b7DKxQF4KHYpLws9E12N/pw/+fPtFx1dNbz
 BXCXfwunD+qjGzvZdG2lDyDfbS4Ehc6kbB9+5q0TmwUG4NmqA25pgjOPbpnpu8VtD0f9rU+Y/
 utnMYnvnUiOoqXCh3gC8ubk9oss3wG44KDHs9srVBEvX9/+wH2wEg9lBohIK9oIb+t/a6Swgc
 NXEzr0jAQK9OeccjJJdNJDAJXaobhRC2x1EbbEHdyVAYvaHYbAzEQtqvH2hBI46hhkgco0jOo
 pa1YN+7WIVxF6xXR/sqIydC1VQ5UAq0XquTWahAAdM9S97zNUkzRM7LZtvvmk7fwY8/TruN/b
 /DP7220xsKFeKDIhAS3mbkTO0Io4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_093432_352740_E6950F29 
X-CRM114-Status: UNSURE (   8.77  )
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

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 28 Feb 2025 18:25:31 +0100

Reduce nested max() calls by a single max3() call in this
function implementation.

This issue was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4=
i/sun6i_mipi_dsi.c
index c35b70d83e53..7765a29e2ef6 100644
=2D-- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -597,7 +597,7 @@ static void sun6i_dsi_setup_timings(struct sun6i_dsi *=
dsi,
 	}

 	/* How many bytes do we need to send all payloads? */
-	bytes =3D max_t(size_t, max(max(hfp, hblk), max(hsa, hbp)), vblk);
+	bytes =3D max_t(size_t, max3(hfp, hblk, max(hsa, hbp)), vblk);
 	buffer =3D kmalloc(bytes, GFP_KERNEL);
 	if (WARN_ON(!buffer))
 		return;
=2D-
2.48.1


