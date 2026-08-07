Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8276EC2A09B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 17:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lRjAT478Uz3ZQXBeUJ/wQtNqpl6lKAtydNqvVxPKT04=; b=KDLSKmWnCjq+rH8oXX/tjxfPMw
	tmglXsSKPFlfml9rhTbAP8yXO2TrcsLyQNpftfjl569rFhun+nUkXdO6AwHOVZzs7NIcYwk71wBEz
	mHKA/awARmuDnXF31FvmZAbL6XIwPLql5n+ANuo4SR8C32KyyljBw1OtAp+YyTmISgp3LizYj4gca
	KIiwLczo/esX0JA/VMtInWtPCX7Sz54/JyEF5JL/2DnjmjDDV5WiOxL8Hv/wdhbUO+9pO65tCUQhM
	XuHBVEebuSQ2kvhSsiaFLJ/s0NcDkLe3VhXm79xsl2Qnx3yig9NzQGCSB0ky5Mlia9TKnXVroSmE3
	gWdeF1Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsOin-00000008Xzl-1TzH;
	Fri, 07 Aug 2026 17:51:05 +0000
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsOik-00000008Xyo-1nbU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 17:51:04 +0000
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-6aeaaef491cso1113472eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 10:51:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786125061; cv=none;
        d=google.com; s=arc-20260327;
        b=Cn8mpGwbhTB1j9qGZBV7+XXlCgGq3L3ZM6VGwvHI7ZMV28YVudFvb7zFsa2us/bhxp
         ryYFt03/z5LE09CdkgSDg1Sus1W+Swcc8GpRjrlj8wCLH1Sss6AhTXNPcyIfIowE5YAl
         xfCy/9Oz0WG7DyGDWPR50mRq8TGqGhZfGrHXyUabAk3n/R9888XDDBK6Xsaf8vRgALIy
         o8ATrCLDA42WyCwe18iwNIaCPmotVlht9YEW+gl+4BnJ/HZHkuqBdPaY7xh/J7y/4oKr
         hLWwg29fTQvEpdoTU4zrffY2zBqnGRHjiVNkRBDeMyvANSPOhELbaP34KH+zITCFOZSI
         +vKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lRjAT478Uz3ZQXBeUJ/wQtNqpl6lKAtydNqvVxPKT04=;
        fh=nzgGub/zifwvram5Fksf/jY4gbjKqzmsRPv8Ub3iiW4=;
        b=szFrPKzUWLoN5M62QTJBoni0osIFV3eWVZrlL2Gk9uXM6cF4na0cBY6Gi4eeIYe7sQ
         jwL4OKpSkZqatzIvSSP5+Q3kYRaQ8Lwq1OhvxI4QWBwPmS8VRPBmq9nzeczdFh0Gfzbh
         HByCBk6Y69CjL5tbZrFD5mlfNVPBaknZbqtZF2TyzXIrRbYF+pN3DV+05XWUsnmgnldw
         dMLl5Nwq4Xx7+w6k+aFURcPl+cVZRDrmL9Gp4sew0C4AW+QKtsKLCOF7OLZ8UiG+H/pM
         ZK5B2CGf3DtoBdLE58Hl0Z4UmCUCvYISebijO8k21Syjlr01dca7LYOMu5N29jlvF8s+
         WPuQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786125061; x=1786729861; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lRjAT478Uz3ZQXBeUJ/wQtNqpl6lKAtydNqvVxPKT04=;
        b=Ln1aeJwL090UPvq/Uv77jF/V4V0G9WgB+K6OaPsJcNvaXfHMT9FrlxQOp+j+oI28ro
         39eOlPA3FjYZhCBZcwlOwNlVjeh11NYz4itMGyU4J6XyG3Waji+OMyN3RKvHtyX4xcsF
         PctrGX/AuWkwKMNdC3Rsp/YCA9g+Aoedk4BHg7YykCnClTSJ3ZNgcV/220zmnjWyfG+L
         shbtHqBiRgsJ4iyG++wT4KMlLjtbriX09c95sb2l7v1O8gf6Vc7Kxkxa5+nnqpWiY6JK
         qj7JKTFzUX6yR6oMSTkl7bIYFTEC21cwH4brsZCOATGnLnIBXRm6DfrPl6r12+HY5PH+
         6r8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786125061; x=1786729861;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lRjAT478Uz3ZQXBeUJ/wQtNqpl6lKAtydNqvVxPKT04=;
        b=mCKFoEZm1ACekyyCL4reB9NqOpPhzFEgNwvyizH73zEtqup9UmgFRRHngrXKOKs6SH
         0GNdO0Do7zKkaYrRJVCdx4pw5YolkZ6gpJDU5s+JOuqDXfyzj/bzykYW6M7TnEQB1JEo
         14HL8Vx7pz3Bs/drrQiSeBWqfSNuUHF8WlIVjgxWdRigp/i2y/KmLNDZGo4ZfBvIzykx
         PpeMANXY8big3jlsVPYDO2jCM1H+qMwZkxNs9NfxgCzJ0rSm+nkOJb026MfOhCxvcOR0
         ywpyZVutJGPpFcf2RMoTAWqnKOcdHJbGW8N6/6NZTVEq+4dZw9P1cFdcIePeNB13HXOY
         Twiw==
X-Forwarded-Encrypted: i=1; AHgh+Ro7f8G9x4y1IX6NRmPUehuS9LnRg7aHlZfBeTd3HGGYlT2IwJzFT4kcSYjxqhD8tcN2AZceJV0hRiIqVzt1OPTU@lists.infradead.org
X-Gm-Message-State: AOJu0YwrrmasdKup+kfYYU50ypLxnJztG2oyMQkB6GQRZJ1/xJ+3jEnc
	JFIan2zuxCMPqyw3YwJd4Y4Rh1O8vKoWWvEOlLJmPUe3JWzo8Yvq7l758j4WKQSwxz2UAIC1kV+
	ppqdH4A3symSN6PHrfX+oGiXmiGE9o7E=
X-Gm-Gg: AR+sD10AIsF9J/IbpH4tUZLExg9oCcSGxzQMfISRMse8eLmIk9ffkQdLqsW+T5hramQ
	dNzYu5lduAPDeD/Uz+asGDMROPhffQivXHiHBcO7BgvRyTXyBqksoXebtkEDbbGatMkbuJ5itfh
	jyFWCvjYMplq3/Tz96eLrPnDk5X5RCXJKMX7rd3r9j48Juy1Xx2R0IbS5zFVmDB9rBMIVH4og37
	f6If5KVtWwqMb/N2mfojLo4zEroVeiXOzjT9IFGq1qJmjaybJokR313sy7tme2kliAyVhQSzMjt
	Iyqlq8PUOqnJ6pZ/RzuiAvBmOlDxDMX1fNH/CB/7N8Dvv9qgCVIp8Rudbeo9VM+RQKOL6nNzYKG
	+YQ==
X-Received: by 2002:a05:6820:811:b0:6b0:40d9:8ac6 with SMTP id
 006d021491bc7-6b041f594b5mr991109eaf.9.1786125060721; Fri, 07 Aug 2026
 10:51:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260728091804.382753-1-wenst@chromium.org> <amiqKRkFItYwD6oL@redhat.com>
 <CAGb2v64zUO-azpTuei6LCypad2noGFbg+EmaBC1iidoZ2stQzw@mail.gmail.com>
 <c1048eae-72c5-4e2e-ac49-25e2c4297018@collabora.com> <CAGXv+5EgGYFVt4TJCysQgRqA1J5=Qz9c0oWY5YTxgc5PnNC_AQ@mail.gmail.com>
 <36f2775a-d332-4913-8e9e-ca0429c3f713@collabora.com> <amswFn2qWkvypMH8@redhat.com>
 <CAGb2v65yEtUH5LQ=kGL1io-urha12iOute=D2bbG872YXbK4fQ@mail.gmail.com>
In-Reply-To: <CAGb2v65yEtUH5LQ=kGL1io-urha12iOute=D2bbG872YXbK4fQ@mail.gmail.com>
From: YoungJoon Lee <getfeus@gmail.com>
Date: Sat, 8 Aug 2026 02:50:47 +0900
X-Gm-Features: AUfX_mw5H1veunrAd0DWILURr17Bo7nhldWDJMLG41xotTB7eMODtkVZIaJFjgA
Message-ID: <CA+m4KrDpcdJZBXT5wN+NHV+BtLLT-suhamCmzg+gUhamvbPR8Q@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] powervr: MT8173 GPU support
To: wens@kernel.org
Cc: Brian Masney <bmasney@redhat.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Alessio Belle <alessio.belle@imgtec.com>, Luigi Santivetti <luigi.santivetti@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Icenowy Zheng <zhengxingda@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_105102_488187_8100E677 
X-CRM114-Status: GOOD (  49.27  )
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

Hi Chen-Yu,

A follow-up on the GX6250 issue.

I ran the diagnostic test I mentioned in my previous reply, and I now
have a reproducible system hang along with HWRT/free-list lifetime
traces.

I built a diagnostic kernel with temporary tracing around the PowerVR
HWRT and free-list lifetime paths, and ran:

PVR_I_WANT_A_BROKEN_VULKAN_DRIVER=3D1 glmark2-es2-drm

The test was run from multi-user.target with no display manager running.

This time glmark2 progressed past the point where it had previously
failed, but later the entire system became unresponsive during the
desktop/blur part of the benchmark.

At that point:

- SSH stopped responding
- local keyboard and VT switching stopped responding
- the system required a hard power cycle

The HWRT teardown trace immediately before the hang was interesting.

Normal HWRT destruction repeatedly looked like this:

dataset-release
-> HWRTDATA cleanup data=3D1, err=3D0
-> HWRTDATA cleanup data=3D0, err=3D0
-> free-list release slot=3D0
-> free-list release slot=3D1

For the last HWRT visible before the machine stopped responding, the
trace ended at:

pvr-hwrt: dataset-release hwrt=3Dffff0000c0c62800 ...
pvr-hwrt: cleanup hwrt=3Dffff0000c0c62800 data=3D1 err=3D0 ...
pvr-hwrt: cleanup hwrt=3Dffff0000c0c62800 data=3D0 err=3D0 ...

There was no further PowerVR trace before the system hung.

Therefore, I do not think I can conclude that the free-list reference
counting itself is the root cause.

What I can say from this instrumentation is that both HWRTDATA cleanup
calls returned successfully, and the trace stopped before
hwrt_fini_kernel_structure() reached its first free-list release
message.

The tracing is intentionally verbose and may affect timing, so I do
not want to over-interpret the exact failure point.

I have the diagnostic patch, the full kernel log, the HWRT/free-list
lifetime trace, and the glmark2 output available.

Would it be useful for me to send these to the Imagination/DRM mailing
lists now, or is there a particular person or list you would prefer me
to report this to?

If there are specific additional tracepoints you would like around
hwrt_data_fini_fw_structure() or hwrt_fini_common_fw_structure(), I
can build another diagnostic kernel and reproduce the issue again.

Thanks again for taking a look.

Best regards,
YoungJoon Lee

2026=E5=B9=B47=E6=9C=8830=E6=97=A5(=E6=9C=A8) 21:38 Chen-Yu Tsai <wens@kern=
el.org>:
>
> On Thu, Jul 30, 2026 at 7:06=E2=80=AFPM Brian Masney <bmasney@redhat.com>=
 wrote:
> >
> > Hi Angelo and Chen-Yu,
> >
> > On Thu, Jul 30, 2026 at 10:23:14AM +0200, AngeloGioacchino Del Regno wr=
ote:
> > > On 7/30/26 06:51, Chen-Yu Tsai wrote:
> > > > On Tue, Jul 28, 2026 at 10:33=E2=80=AFPM AngeloGioacchino Del Regno
> > > > <angelogioacchino.delregno@collabora.com> wrote:
> > > > >
> > > > > On 7/28/26 15:13, Chen-Yu Tsai wrote:
> > > > > > On Tue, Jul 28, 2026 at 9:10=E2=80=AFPM Brian Masney <bmasney@r=
edhat.com> wrote:
> > > > > > > On Tue, Jul 28, 2026 at 05:17:58PM +0800, Chen-Yu Tsai wrote:
> > > > > > > > Hi everyone,
> > > > > > > >
> > > > > > > > This is v4 of my MT8173 PowerVR GPU support series.
> > > > > > > >
> > > > > > > > This time around Mesa was ready for basic testing, using bo=
th vulkanmark
> > > > > > > > and glmark2-es2-drm (with Zink). Details below.
> > > > > > > >
> > > > > > > > Changes since v3 (all in the clk driver patch):
> > > > > > > > - Changed pm_runtime_put() to pm_runtime_put_sync()
> > > > > > > > - Added missing of_node_put() in remove function
> > > > > > > >
> > > > > > > > Changes since v2 (all in the clk driver patch):
> > > > > > > > - Made COMMON_CLK_MT8173_MFGTOP depend on PM
> > > > > > > >     - Needed since the driver implements PM domains using t=
he generic PM
> > > > > > > >       domain library, which also depends on PM
> > > > > > > >     - Fixes build breakage (kernel test robot)
> > > > > > > > - Fixed "RST_DELAY_CNT" name (Brian)
> > > > > > > > - Dropped unused mfg_desc (Brian)
> > > > > > > > - Added check of clk_prepare_enable()'s return value in
> > > > > > > >     clk_mt8173_mfgtop_power_on() (Brian)
> > > > > > > > - Saved error value for return in IS_ERR(data->clk_26m) bra=
nch
> > > > > > > >     (Dan Carpenter / kernel test robot w/ smatch)
> > > > > > > >
> > > > > > > > Changes since v1:
> > > > > > > > - Adapted to changed DT bindings
> > > > > > > > - Dropped driver change
> > > > > > > > - Use same power domain for "a" and "b" GPU power domains
> > > > > > > >
> > > > > > > >
> > > > > > > > This series enables the PowerVR GPU found in the MT8173 SoC=
, found in
> > > > > > > > some Chromebooks.
> > > > > > >
> > > > > > > I'm making a pull for Stephen for the clk changes. Should pat=
ches 1,2,4
> > > > > > > go through the clk tree? Patches 3,5 go through the DRM tree?
> > > > > >
> > > > > > Only patches 1 and 2 should go through the clock tree.
> > > > > >
> > > > > > Patch 3, 4, 5 can all go through the soc tree if Angelo wants t=
o pick up
> > > > > > DT binding patches. Otherwise I can push patch 3 through drm-mi=
sc.
> > > > > >
> > > > >
> > > > > Not sure if I can really take the DRM bindings patch through soc.
> > > > >
> > > > > I will take the devicetree ones exactly right now, even though it=
's going to
> > > > > give warnings.
> > > >
> > > > Apologies for missing this, but the first DT patch depends on the c=
lk DT
> > > > bindings patch for the clk ID macros. This is causing build errors =
in
> > > > linux-next right now.
> > > >
> > > > Not sure how we can fix this right now.
> > > >
> > > > Brian, would it be possible for you to split out that patch into a
> > > > separate immutable branch for Angelo to merge?
> >
> > Yes, I can split things out and make an immutable branch this morning.
> > But it sounds too late for that.
> >
> > > >
> > > > Otherwise Angelo might need to drop the DT patches until the next c=
ycle.
> > >
> > > Yeah, that's so bad.
> > > I'd be happy to be able to resolve this, but it's too late on my side=
.
> > >
> > > I should've checked the DT patches more carefully, my bad: I got a bi=
t too excited
> > > to finally see this PowerVR stuff working on MT8173 and going upstrea=
m.
> > >
> > > Sadly, I have to drop the devicetree patches :-(
> >
> > Chen-Yu: Could Angelo add an Acked-by to the three patches, and then I =
send
> > Stephen an additional pull with just those patches? Do you think he'd
> > pull that?
>
> (replying from my @kernel.org address again because I don't feel like
>  pulling out my work laptop.)
>
> I think the question is whether the soc & dt maintainers would be bothere=
d
> by it or not.
>
> No need to sweat over it though. It's not like the GPU driver is producti=
on
> ready anyway. We can just merge the DT patches in the next cycle. :)
>
>
> ChenYu

