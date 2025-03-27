Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29201C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 08:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZNaFBHARD8RYWQkk61EfntzC+oHyDk/Nf1u/x+30pAY=; b=HwnMN53hhFQobVvrdGz59ePn6l
	sc0aHh3b9X10u3LpOp84sKNZsGle3DgdaMgXirja99Xn4gwxC3mXRWOWEYRxGIZCVR3LFBf3CCHBb
	XBuGx97NOldFN783OGRR5nV/PWUMGpBDeayRT1eNt7fWjpfxmRtO+68aYF/kZagSTx0zvpvF7tKzI
	hX56gNLtR9P69JCLEWP5qky4MIRVMi/VoM9NOe23vQ93Kezz9uqc7+tlMyFj0tFfa68oJfcn3/Z5l
	llCoMa0sl8tjBRILkPJ4ogkGY20Cg8BmvqNlqa2aJPG0Ouv+bRynI17L4m8qiuEM1E6G9q1/B6wpm
	WggRT9Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txibv-0000000ASKo-13ZT;
	Thu, 27 Mar 2025 08:29:11 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txiaB-0000000AS6X-38yc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 08:27:25 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-2b8e2606a58so353362fac.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Mar 2025 01:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743064043; x=1743668843; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZNaFBHARD8RYWQkk61EfntzC+oHyDk/Nf1u/x+30pAY=;
        b=vpCmPQrV7u3fdycypuJFh0M0EYugyYmtSqXjY331YxJJnUxP1lz0R9u8hvZVyUL+xz
         gMqV9AtR1K1Y68ujoxdIvbs8m9aiH59uxpZhI8FVf4lwMGBKv7X5P3U+A5M6bE7n06qt
         hGvSftuF6mljU9vMltnHm51x8ovt+3BJ7ph103vPdRJA2OpI4hB2z2gyKRdn5Tj/ighp
         lSvqKnA/Rh+Mjz3KJCKK5a2uCo30o78j8eGOzxh7ErVmJpm55mNihbX9YYM7TVyfPUBl
         md4HbAxCQsy0YR6EdhZXSJba0Cr1JClMjB7EodQd5EjotIVJ4T3VB2CoA+vLzrrnjXxX
         XxTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743064043; x=1743668843;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZNaFBHARD8RYWQkk61EfntzC+oHyDk/Nf1u/x+30pAY=;
        b=FBBFwwuEob+vaykdutEBDndrepNgkEVTe+bUDRFhc5jeVLmE1eSERESsVhraxIZhUE
         4E3y8uvOy6I0gG8KmIUdS0Fi/cmYJt0+1nUPlXpDPjMPkBLODKPPW2ZYxQEi5vNeED3D
         YkI3FcY8vg9LIMWTVPdvIMBomAygk2hv0MMjoUHoWhOiTMbarKQ5DZfQsTIeEB1H7l4H
         BRz5HXb3AEKdJKm0tn+qHZ8RdUUd0pYftriMp2LTVCDZAL0eoTvlsf+fSv5XJfIvtL6h
         miRY2o0r+trNC7oPsH2XRdJC7JzN6Fffdl4Un/gYK1mFcslasF40sOwMvJdFN7fUVRsV
         QTFg==
X-Forwarded-Encrypted: i=1; AJvYcCUSNyFLz9WyO3aASXFbO4cOvl6t+Iymeri74H58/lHxWT39FekrxorxiymcvRByuBjcLvBT1a3ycSBHg7Ss9Skm@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8JNCXD1+932EeMWE8YFkg6ivTOHeNmqj97wqg/wI4aATl2Q/f
	/pTbTm3TLAd9Hf7jOj4IiLwVjkGyFPIVFAqdT/DkziNCTOFCeJoDGY0zkGE61IbuVPT4u+SG5Pe
	dutO05+YGKzhBIpnNuQtefyk4f8FSGENvEu03xQ==
X-Gm-Gg: ASbGncuZoiJWmlDYhmhWVliHHWnSGa8ejCS592oBu9FKaT/OANqrgAHL4nC63ev3K8u
	IKXkFFMwHvMpekjMlF+iVYIxBqwR6Sg9GIXB0dJbb6GkODMnmsRlMC4G/S47EAb8EUXbb2wyBhs
	2MeDYMDCGgpeWBf/mNnHCc4yBl8tQ=
X-Google-Smtp-Source: AGHT+IE4Y73Pz4N1BwH9vcQsjd8miSlNYWKQ9DjG4P07KcqUpTb0YMUN/u49Pwe5re+n/OV+igA1ripHNomVy4YAKtk=
X-Received: by 2002:a05:6870:56a9:b0:2b7:d3d2:ba53 with SMTP id
 586e51a60fabf-2c847f850famr1469213fac.12.1743064042412; Thu, 27 Mar 2025
 01:27:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250305130634.1850178-1-jens.wiklander@linaro.org>
In-Reply-To: <20250305130634.1850178-1-jens.wiklander@linaro.org>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 27 Mar 2025 09:27:11 +0100
X-Gm-Features: AQ5f1JrlH0shoTWzAhW6qEWQAlS0oouzF_cE5El7sl3-QfofSRRMGfXh-_QnuWM
Message-ID: <CAHUa44F7HYQ8uR1vpu5XfR+Ag89JPpttW7hUvGROcXbPvXBXVA@mail.gmail.com>
Subject: Re: [PATCH v6 00/10] TEE subsystem for restricted dma-buf allocations
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org
Cc: Olivier Masse <olivier.masse@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Sumit Garg <sumit.garg@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com, 
	Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_012723_799968_0AEF9AA2 
X-CRM114-Status: GOOD (  38.93  )
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

Hi,

On Wed, Mar 5, 2025 at 2:06=E2=80=AFPM Jens Wiklander <jens.wiklander@linar=
o.org> wrote:
>
> Hi,
>
> This patch set allocates the restricted DMA-bufs from a DMA-heap
> instantiated from the TEE subsystem.
>
> The TEE subsystem handles the DMA-buf allocations since it is the TEE
> (OP-TEE, AMD-TEE, TS-TEE, or perhaps a future QTEE) which sets up the
> restrictions for the memory used for the DMA-bufs.
>
> The DMA-heap uses a restricted memory pool provided by the backend TEE
> driver, allowing it to choose how to allocate the restricted physical
> memory.
>
> The allocated DMA-bufs must be imported with a new TEE_IOC_SHM_REGISTER_F=
D
> before they can be passed as arguments when requesting services from the
> secure world.
>
> Three use-cases (Secure Video Playback, Trusted UI, and Secure Video
> Recording) has been identified so far to serve as examples of what can be
> expected. The use-cases has predefined DMA-heap names,
> "restricted,secure-video", "restricted,trusted-ui", and
> "restricted,secure-video-record". The backend driver registers restricted
> memory pools for the use-cases it supports.

When preparing a v7 of this patch set, I'll switch to "protected"
instead of "restricted" based on Nicolas Dufresne's comment [1],
unless someone objects.

[1] https://lore.kernel.org/lkml/32c29526416c07c37819aedabcbf1e562ee98bf2.c=
amel@ndufresne.ca/

Cheers,
Jens

>
> Each use-case has it's own restricted memory pool since different use-cas=
es
> requires isolation from different parts of the system. A restricted memor=
y
> pool can be based on a static carveout instantiated while probing the TEE
> backend driver, or dynamically allocated from CMA and made restricted as
> needed by the TEE.
>
> This can be tested on a RockPi 4B+ with the following steps:
> repo init -u https://github.com/jenswi-linaro/manifest.git -m rockpi4.xml=
 \
>         -b prototype/sdp-v6
> repo sync -j8
> cd build
> make toolchains -j$(nproc)
> make all -j$(nproc)
> # Copy ../out/rockpi4.img to an SD card and boot the RockPi from that
> # Connect a monitor to the RockPi
> # login and at the prompt:
> gst-launch-1.0 videotestsrc ! \
>         aesenc key=3D1f9423681beb9a79215820f6bda73d0f \
>                 iv=3De9aa8e834d8d70b7e0d254ff670dd718 serialize-iv=3Dtrue=
 ! \
>         aesdec key=3D1f9423681beb9a79215820f6bda73d0f ! \
>         kmssink
>
> The aesdec module has been hacked to use an OP-TEE TA to decrypt the stre=
am
> into restricted DMA-bufs which are consumed by the kmssink.
>
> The primitive QEMU tests from previous patch set can be tested on RockPi
> in the same way with:
> xtest --sdp-basic
>
> The primitive test are tested on QEMU with the following steps:
> repo init -u https://github.com/jenswi-linaro/manifest.git -m qemu_v8.xml=
 \
>         -b prototype/sdp-v6
> repo sync -j8
> cd build
> make toolchains -j$(nproc)
> make SPMC_AT_EL=3D1 all -j$(nproc)
> make SPMC_AT_EL=3D1 run-only
> # login and at the prompt:
> xtest --sdp-basic
>
> The SPMC_AT_EL=3D1 parameter configures the build with FF-A and an SPMC a=
t
> S-EL1 inside OP-TEE. The parameter can be changed into SPMC_AT_EL=3Dn to =
test
> without FF-A using the original SMC ABI instead. Please remember to do
> %rm -rf ../trusted-firmware-a/build/qemu
> for TF-A to be rebuilt properly using the new configuration.
>
> https://optee.readthedocs.io/en/latest/building/prerequisites.html
> list dependencies needed to build the above.
>
> The tests are pretty basic, mostly checking that a Trusted Application in
> the secure world can access and manipulate the memory. There are also som=
e
> negative tests for out of bounds buffers etc.
>
> Thanks,
> Jens
>
> Changes since V5:
> * Removing "tee: add restricted memory allocation" and
>   "tee: add TEE_IOC_RSTMEM_FD_INFO"
> * Adding "tee: implement restricted DMA-heap",
>   "tee: new ioctl to a register tee_shm from a dmabuf file descriptor",
>   "tee: add tee_shm_alloc_cma_phys_mem()",
>   "optee: pass parent device to tee_device_alloc()", and
>   "tee: tee_device_alloc(): copy dma_mask from parent device"
> * The two TEE driver OPs "rstmem_alloc()" and "rstmem_free()" are replace=
d
>   with a struct tee_rstmem_pool abstraction.
> * Replaced the the TEE_IOC_RSTMEM_ALLOC user space API with the DMA-heap =
API
>
> Changes since V4:
> * Adding the patch "tee: add TEE_IOC_RSTMEM_FD_INFO" needed by the
>   GStreamer demo
> * Removing the dummy CPU access and mmap functions from the dma_buf_ops
> * Fixing a compile error in "optee: FF-A: dynamic restricted memory alloc=
ation"
>   reported by kernel test robot <lkp@intel.com>
>
> Changes since V3:
> * Make the use_case and flags field in struct tee_shm u32's instead of
>   u16's
> * Add more description for TEE_IOC_RSTMEM_ALLOC in the header file
> * Import namespace DMA_BUF in module tee, reported by lkp@intel.com
> * Added a note in the commit message for "optee: account for direction
>   while converting parameters" why it's needed
> * Factor out dynamic restricted memory allocation from
>   "optee: support restricted memory allocation" into two new commits
>   "optee: FF-A: dynamic restricted memory allocation" and
>   "optee: smc abi: dynamic restricted memory allocation"
> * Guard CMA usage with #ifdef CONFIG_CMA, effectively disabling dynamic
>   restricted memory allocate if CMA isn't configured
>
> Changes since the V2 RFC:
> * Based on v6.12
> * Replaced the flags for SVP and Trusted UID memory with a u32 field with
>   unique id for each use case
> * Added dynamic allocation of restricted memory pools
> * Added OP-TEE ABI both with and without FF-A for dynamic restricted memo=
ry
> * Added support for FF-A with FFA_LEND
>
> Changes since the V1 RFC:
> * Based on v6.11
> * Complete rewrite, replacing the restricted heap with TEE_IOC_RSTMEM_ALL=
OC
>
> Changes since Olivier's post [2]:
> * Based on Yong Wu's post [1] where much of dma-buf handling is done in
>   the generic restricted heap
> * Simplifications and cleanup
> * New commit message for "dma-buf: heaps: add Linaro restricted dmabuf he=
ap
>   support"
> * Replaced the word "secure" with "restricted" where applicable
>
> Etienne Carriere (1):
>   tee: new ioctl to a register tee_shm from a dmabuf file descriptor
>
> Jens Wiklander (9):
>   tee: tee_device_alloc(): copy dma_mask from parent device
>   optee: pass parent device to tee_device_alloc()
>   optee: account for direction while converting parameters
>   optee: sync secure world ABI headers
>   tee: implement restricted DMA-heap
>   tee: add tee_shm_alloc_cma_phys_mem()
>   optee: support restricted memory allocation
>   optee: FF-A: dynamic restricted memory allocation
>   optee: smc abi: dynamic restricted memory allocation
>
>  drivers/tee/Makefile              |   1 +
>  drivers/tee/optee/Makefile        |   1 +
>  drivers/tee/optee/call.c          |  10 +-
>  drivers/tee/optee/core.c          |   1 +
>  drivers/tee/optee/ffa_abi.c       | 194 +++++++++++-
>  drivers/tee/optee/optee_ffa.h     |  27 +-
>  drivers/tee/optee/optee_msg.h     |  65 ++++-
>  drivers/tee/optee/optee_private.h |  55 +++-
>  drivers/tee/optee/optee_smc.h     |  71 ++++-
>  drivers/tee/optee/rpc.c           |  31 +-
>  drivers/tee/optee/rstmem.c        | 329 +++++++++++++++++++++
>  drivers/tee/optee/smc_abi.c       | 190 ++++++++++--
>  drivers/tee/tee_core.c            | 147 +++++++---
>  drivers/tee/tee_heap.c            | 470 ++++++++++++++++++++++++++++++
>  drivers/tee/tee_private.h         |   7 +
>  drivers/tee/tee_shm.c             | 199 ++++++++++++-
>  include/linux/tee_core.h          |  67 +++++
>  include/linux/tee_drv.h           |  10 +
>  include/uapi/linux/tee.h          |  29 ++
>  19 files changed, 1781 insertions(+), 123 deletions(-)
>  create mode 100644 drivers/tee/optee/rstmem.c
>  create mode 100644 drivers/tee/tee_heap.c
>
>
> base-commit: 7eb172143d5508b4da468ed59ee857c6e5e01da6
> --
> 2.43.0
>

