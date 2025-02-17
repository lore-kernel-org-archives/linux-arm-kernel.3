Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54164C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 11:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YCHgqCGPyppIzTg8nYy6++VTAaw11B/uWwIDShJFLcU=; b=U745H15far6YgwGLJmc+fDTaoP
	kS5ebDxLxikeTH89ie1rP+LewQuWmsSBuXdURbFsJBWMcO1uwU1K4BU72Rkdhr+8S0nS4S6ilMzFa
	4LW/6b/4GhcKN2eoFZ07Fsr/HJ3i1OL1uRdI2Yqy0uHKZqkiyYrseLS5dvo66n++V5Fv9FE+FvwD7
	xpDmc/h7zbFQmvdNp8jwb+uaWMK27yKDRouRQr5/ewR29jCXEbJk50Dqn0alvC7k1h3/tiB8t/weW
	roeVm0LUEZFDVuaFnQvr2KVIBRwbOAn84tR7CrBshoYMHztJv0T9ltq0ugsKtbRtWGvXRpKK1f84P
	7llrzLKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjzBL-00000004Hps-0Lbz;
	Mon, 17 Feb 2025 11:20:59 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjz9r-00000004HZx-1YuL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 11:19:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=YCHgqCGPyppIzTg8nYy6++VTAaw11B/uWwIDShJFLcU=;
	t=1739791167; x=1741000767; b=qcGJKm7C81lq0kJ/KkyYk6NvdIfI+QgQ+JKdaSCjSrMWSbu
	Y+lNUk4KwdpN5MW2tA5j5+P1qglw+I6K+wg0rcP5Vt8ugaCS7KbL8ltDTPZqmluzSF8ir1V8wIRmF
	bMHNhGZSxMAbfS2zvQb524a6nJVw8HxeHuK+NR4mlTu4cB4vCHsN56qaFrQ5k3kZPPvYb2ByhgBTH
	Km6IXlxdFQlbpGAxwKajsiYJgVgMgT61+cY0mp/ew+V/9d8Vp8xS+WMacnkxRegYGrPRXmAf+vUyw
	gz9bm2tm4IwQf+yaRTIR740G/9/uGupcfmAbd1Rb1T6a34IZk4RJ4wEhnBRAUD2Q==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98)
	(envelope-from <johannes@sipsolutions.net>)
	id 1tjz9g-00000000IgW-1rh8;
	Mon, 17 Feb 2025 12:19:16 +0100
Message-ID: <59333d4aa8a3bb3222967d70d10d9288cece444c.camel@sipsolutions.net>
Subject: Re: [RFC][PATCH 00/10] pstore: directly mapped regions
From: Johannes Berg <johannes@sipsolutions.net>
To: Eugen Hristev <eugen.hristev@linaro.org>, linux-arm-msm@vger.kernel.org,
 	linux-hardening@vger.kernel.org, kees@kernel.org
Cc: linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
 rafael@kernel.org, 	dakr@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, tony.luck@intel.com, 	gpiccoli@igalia.com,
 pmladek@suse.com, rostedt@goodmis.org, 	john.ogness@linutronix.de,
 senozhatsky@chromium.org, quic_mojha@quicinc.com, 
	linux-arm-kernel@lists.infradead.org, kernel@quicinc.com
Date: Mon, 17 Feb 2025 12:19:15 +0100
In-Reply-To: <b304d582-9328-4e1b-9e34-5604125b0c06@linaro.org>
References: <20250217101706.2104498-1-eugen.hristev@linaro.org>
	 <c4b48faeae8531e670ea5909800d1a0bfed69862.camel@sipsolutions.net>
	 <b304d582-9328-4e1b-9e34-5604125b0c06@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_031927_410351_A0258ADC 
X-CRM114-Status: GOOD (  16.35  )
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

On Mon, 2025-02-17 at 12:44 +0200, Eugen Hristev wrote:
>=20
> At this moment going through devcoredump is not something that impacts
> the idea of the implementation.

Yeah. I don't think it _should_ go through it at all.

> The whole reason of going through it (because things work without it as
> well), is to see whether this has any kind of impact or not, and if
> there is any kind of fit/reason of going through it.

So it's just a trial balloon?

> Devcoredump is involved because the whole core registration is similar
> to a core area that devcoredump could use.

Yeah but ...=20

> For example, would it be interesting to have a handler going through all
> devices, and have the dump areas already registered ?
> Meaning, when there is a request to generate a core dump, one could
> directly dump this area instead of calling back the driver, and provide
> that to the userspace instead of the driver calling the dev_coredumpv by
> its own.

I'll be blunt ... so you _really_ haven't understood devcoredump then?

It's really not doing this. It's not meant to do this... It's intended
to dump data from inside the device when the device crashes.

Please remove devcoredump involvement from this series.

johannes

