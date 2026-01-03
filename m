Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF78AFC6182
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Jan 2026 20:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5zS3GPiKua9VdhT2Gn8Zsd5LMSooy+BVRaJpFgfl9+s=; b=egN7rCOwRUGfzbDf90T3RkI5XL
	h9C1JXsqhH6RuS1B5+lXO5HePa3A9tjXcVOztZfs9YDexZbWdbQc7Qvj3+Da9wM7pWX59leTDUS8i
	40j6zFQ6SW3LG5ZQcGJ5+e/f6XKEns0stw7ieUnXmDSuo9QfjIrHQinNZEAXOeQvqQRBrmu9QklVw
	7ZJoPwUlcWD4XJ/wXVpjmMdMNcBH8o3BzWYzWy4V4mjxQKla87+Kq4rePDfixVAqg6M5n1KB4lOPy
	ETNS/GYrmES7mC9CUlIm7CdGdSL728I32WyKzFEdJsBTqKkrxEfBHG3LA2zVrKDrCjDUxsmHAwVtn
	GlM8q56A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc7xC-00000009lCM-3OIC;
	Sat, 03 Jan 2026 20:10:27 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc7xA-00000009lBk-05UG;
	Sat, 03 Jan 2026 20:10:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1767471012; bh=5zS3GPiKua9VdhT2Gn8Zsd5
	LMSooy+BVRaJpFgfl9+s=; b=Ug+sPEiv9fSbDr87P8hJArBBffoTyyAcUfBNo/Ua3aCZeaT0zF
	s76+y9MITczt+7iH4r+EZdi3m0K/CudH6e4S6eEHmLL1qKgQEuYw3a5A6qFLTad3TcTcQ7LUzGn
	eKp73i5k9OsZFgeymMCi0Tkel/t/G1sRfBkIFTOOpVX0SfUMokPBZZsCs3xPkL7/jsEPaM3eEBB
	io3tmYBwFrTrclzgKH8k6xbCf7nKoDaUzECv58tVU3m7A6rj7+McsURPwOjT10bapi+u9M0+Npw
	QkGaTK6aqbHj1FIo9EpH7p22AIpjDT8jrzQ4KIBTL5FATo2I+LQE+ZDmdfbzHcF42CQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1767471012; bh=5zS3GPiKua9VdhT2Gn8Zsd5
	LMSooy+BVRaJpFgfl9+s=; b=yoOz5K7aGnqDoUVzRKr4ISO6kGNEoGw44bcvAnrcVyvZwo1fhW
	sUKTfXr4iB40CXJsjmzv8Bwfyl34/1X0QABA==;
From: Dang Huynh <dang.huynh@mainlining.org>
To: Detlev Casanova <detlev.casanova@collabora.com>,
 Olivier =?UTF-8?B?Q3LDqnRl?= <olivier.crete@collabora.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Diederik de Haas <diederik@cknow-tech.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Thomas Gleixner <tglx@linutronix.de>, Dragan Simic <dsimic@manjaro.org>,
 Chukun Pan <amadeus@jmu.edu.cn>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Christian Hewitt <christianshewitt@gmail.com>
Subject: Re: [PATCH v2 0/3] media: rockchip: rkvdec: add support for the VDPU346
 variant
Date: Sat, 03 Jan 2026 20:10:08 +0000
Message-ID: <8993014.lOV4Wx5bFT@melttower>
In-Reply-To: <20251226113140.573759-1-christianshewitt@gmail.com>
References: <20251226113140.573759-1-christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_121024_234026_DE3B6A08 
X-CRM114-Status: GOOD (  22.15  )
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

Hi Christian,

On Friday, December 26, 2025 11:31:37=E2=80=AFAM Coordinated Universal Time=
 Christian=20
Hewitt wrote:
> This series depends upon Detlev Casanova's current v7 series for VDPU381 =
and
> VDPU383 support [0]. It adds support for the VDPU346 IP block used for
> H264, HEVC and (in active work) VP9 on the RK356X boards. VDPU346 appears
> to be a close relation to VDPU381 used with RK3588, except with a single
> core, output limited to 4K, and minor feature differences, e.g. HEVC level
> 5.1 on VDPU346 vs 6.1 on VDPU381. To handle differences we declare a new
> compatible.
>=20
> The device-tree changes are derived from prior-art in Detlev's patches for
> RK3576 and RK3588, the vendor kernel [1], and some earlier patch attempts
> from Piotr Oniszczuk and Diederik de Haas.
>=20
> The register differences between VDPU346 and VDPU381 appear to be minimal=
 so
> we currently and intentionally reuse the VDPU381 h264, hevc, and regs fil=
es
> to avoid duplicating code. There is some evidence of buffer size changes =
in
> testing which still need to be explored. If further register analysis nee=
ds
> separate files for VDPU346 the refactoring will be beyond my current n00b
> coding skills and I will either need some coaching or would be happy to
> pass the series over to a more experienced developer.
>=20
> NB: Testing with the v1 series showed lower mbps bitrate performance. This
> appears to be resolved though it's unclear to me whether this results from
> kernel changes or the ongoing reworking of ffmpeg v4l2_request support [2=
].
> However with my current Linux 6.19-rc2 test branch [3] I'm now able to pl=
ay
> Jellyfish H264 and HEVC test media over 100mbps.
>=20
> Changes since v1:
> - Drop DO-NOT-MERGE patch as changes included in Detvlev v7 series
> - Adapt to variant/capability changes in Detlev's v7 series
> - Add bindings ack from Rob
> - Add rkvdec ack from Nicolas
> - Rebase against Linux 6.19-rc2
>=20
> [0] https://patchwork.kernel.org/project/linux-rockchip/list/?series=3D10=
34794
> [1]
> https://github.com/rockchip-linux/kernel/blob/develop-6.6/arch/arm64/boot=
/d
> ts/rockchip/rk356x.dtsi#L1539 [2]
> https://code.ffmpeg.org/Kwiboo/FFmpeg/commits/branch/v4l2request-v3 [3]
> https://github.com/chewitt/linux/commits/rockchip-6.19.y
>=20
> Christian Hewitt (3):
>   media: dt-bindings: rockchip: Add RK3568 Video Decoder bindings
>   media: rkvdec: Add support for the VDPU346 variant
>   arm64: dts: rockchip: Add the vdpu346 Video Decoders on RK356X
>=20
>  .../bindings/media/rockchip,vdec.yaml         |   2 +
>  arch/arm64/boot/dts/rockchip/rk356x-base.dtsi |  49 +++++++++
>  .../media/platform/rockchip/rkvdec/rkvdec.c   | 103 ++++++++++++++++++
>  3 files changed, 154 insertions(+)

I tested this patch series on my RK3566 board with my own test videos and B=
BB=20
(1080p60 and 4k30) using mpv with [1] patchset.

The command I used was:
`mpv --vo=3Ddmabuf-wayland --hwdec=3Dv4l2request input_file.mp4`

Both H264 and HEVC plays with minor framedrops (which to me isn't noticeabl=
e).

You can add my Tested-by:
Tested-by: Dang Huynh <dang.huynh@mainlining.org>

[1]: https://github.com/mpv-player/mpv/pull/14690

Best regards,
Dang


