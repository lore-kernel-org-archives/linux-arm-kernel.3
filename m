Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D44CFCA5FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 16:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nG2T2Alp7V7AR4zEW4H2cF7/r2rfzmYJ1/XwqhpbHio=; b=N4leikVWq/FD13KQoTrVYyImTM
	EJYRZfj9RjRpFuQWaJELG5Ei8FM5d/e2q86UdQ2hNEdc/eO8cCd20bpAA9tnSsfWFfKRLSqUOeoBC
	KpPv+j1bRyl8iD6E0uRfcpesaevTpSg6Zs5aeDAjuz6eLy/7YtjEASmSm9j1VD3b1gLLKj0LZAFXd
	zh9sZcad6Nij/Mrjn6Y0+xCSvqNl2TrAK6h7W4fU30kr6ePfAsPx8wNVOvGGLVW8XxTSWad9o+oL+
	PitepjpHaGcxVLlgG4EgFY3iRgFuE/5V00rTXZE1uvDU7OxqjHvnlwQRLDFNZqZvUxJxXsNy2HqQm
	fZelH9NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBx27-00000006gbU-2edT;
	Wed, 30 Sep 2026 16:19:51 +0000
Received: from mail-ed2-x0c.google.com ([2a00:1450:4864:33::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBx22-00000006gac-46RT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 16:19:50 +0000
Received: by mail-ed2-x0c.google.com with SMTP id 4fb4d7f45d1cf-6acaec6a74aso3160194a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 09:19:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790785184; cv=none;
        d=google.com; s=arc-20260327;
        b=jWdfij88sp2KiQjUQG+eS/2NAD9N8zxN38XUMzfTiFivh7ZhpICQwR9YyDC075QYEf
         RPtUa6sXJekXVnQzIB0MqZssnhnhRRNvwJlrzZvUpg7Nfu94pfcp1TeZ2xd0bz6Brw1i
         6T16FK1Mf8kc+kOqsm/DlQB6yonwDLev6iKmy4SlVzXchpLOBimmf3OUfoztNmfnHqRa
         SkSPhQRLi4vnNE8NzJMkJjvoYUSLbEHOjSqF0w5EpBS6Mn893/3TnTHv00704QuwfhmS
         mphxa0EyDjoblPAd55Z6004k1F0UsqYhCxERHiac+L/HLC+P5+WtsG3T7IOJbxfKM8GI
         5MhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nG2T2Alp7V7AR4zEW4H2cF7/r2rfzmYJ1/XwqhpbHio=;
        fh=flws9L7GtdLSC/21f08Ro2YaVyWt470XgFabsKGKbyQ=;
        b=SFteqe20ubSme5vUmbERCw3GKDAKKDC0E4065w1BILbnJhImAotsX1IK21KzfxxC2f
         ckn0VjpiKvfD4UVFbjxIg50T7k6F6naEMSthtCPBt3CLqczrLABWQ5H4nz1lH5a+ns95
         G6UXQbMprHXX+SLRANB6y7+E8iKMdbpu4oUfCp6zW2Q+sH/0j8/s8QsBCCIG/a62CSj1
         csRpJzUwsAEJXETHzL4wXL02zfrZCdNpcrWgvOuxzFrXtlfNA6K4NDUU4/8POFQmt5CI
         qxkzIpu51lN7UdrO/c7Dr3/gjX9I3kiT/zNoJREsWTK22saV0doenlq2i0wYMTwZlJQL
         vTRQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790785184; x=1791389984; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nG2T2Alp7V7AR4zEW4H2cF7/r2rfzmYJ1/XwqhpbHio=;
        b=mjFjjcUNjm4q+UH0Umur/LSdzlHDaoGgeoOx/rNi7pKHlPqXl3rD9wm6OGWdrVnmCN
         3UwkTzz/R6AGu3FIBViE7tl/fpTws7zMfnKadSJgMP9xORi1RK7lY3QW0m3EAxkE3Xcg
         7ooShHZf8ULYYWk8aOVU6Ug1ISv24BJXgIzcTwminypC4JNfHxECKSS0Duc6h3UZUNFe
         WPQ801L8OZ/p3rGJX/3fTZg/FH+b+4kHSSX2uzNfZ45aDOSuf/qNm2boHTuDP2DNBaBd
         sWH3u5Fu1to0zoLeHxRLz5KtD6rHxwsw4qskb/Q3pzT4qwRr4Cv4rXM84uj8ZPzFfxLr
         dpKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790785184; x=1791389984;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nG2T2Alp7V7AR4zEW4H2cF7/r2rfzmYJ1/XwqhpbHio=;
        b=EstxWCxj547Cv2JKmhGJOeLPTTvyHw6PmcW9XcMX2d+LLVaNuf4aKribMnu6HzXPKI
         cnDpPKVV/DJ3c8eNMijuBBsaHcs2V0qJN58ZzojI8FhgU2Uqr+nYeMvCYIcKdrRqBEO2
         PmeYwtdxjLTQyOe0Kg7/KK2gMpdMDWDQZLtVjxKtYVQMNKk99LVJbO2ZQsaJVq5U9X5h
         netTO9y3P+uzXK9BVLczyFM8t+80XuCVfSVWRiZ5vStPwMRmp8et5vzGPh3eSyHtsLe0
         470eMj+rp3uV4Kd4MfT5a16m2ZXnePeAKvgfSAJTnAOZHZLeaEjb6NSaoj85e+AfbwOX
         8kGA==
X-Forwarded-Encrypted: i=1; AKwUvBz3hip9m5EDcKR/1x+7S935UTsft2gxvfQv7bbvxQ4Q2R2DYjUfqpc1hbAfW15PclyfQUZNKFmgUPpieRR0fqI3@lists.infradead.org
X-Gm-Message-State: AFq9FYJ4J0h3Vtvak4XFYVNZM9hwuLFnNiqj3O0V8k/Avr7a1lJ+1CA5
	5Cz1QRY5PFNalMWGJPJnzp+mbgcB1mo5bkB1xfDq/30bbvRXDZuS6rX/XCERvPF/Ln3B8fN99Xp
	P+z7Dx3tUESYJzdLAT6n+ob3hIvz8Fhg=
X-Gm-Gg: AYBFou1tYTT7s/Bo3icqYdmGAzVlprMoq9Z4JVe7P+GOX+JQfbf4/5GnTT7jdXL4Fdq
	1HbpniApBGXmpZG2WNl4gI0zk6pUwF1tasMkmLXOupgerBk6TrXyGBkyrierVfKshLJHdCQUo6c
	lVADkqDhA8KYUQ83P1AuSUQD5bbWLnsr1gASxAmHPRKwQrOFOn8LAwAqKLoDyCuirixsuiG0hiD
	4nf5XntGHITud7lcPtfxhnV1Qy2hA4uh3lOai+SpUKQ7hXyDpuTu83g/cmrmpKOpHcpCvSPmpzp
	gApiLCoGwfBN0DMaDsxl13Nwh0T4lJD14ZNfxIgLK89KXMOU9EBij3QIKV1iUpR4meBour1XblU
	0loW8lX5xzBuaYUIinj3sQ4timKerRJ5K8QryA5lSVw==
X-Received: by 2002:a17:906:478d:b0:c2b:ca9c:1379 with SMTP id
 a640c23a62f3a-c2e23d80235mr174035666b.28.1790785184054; Wed, 30 Sep 2026
 09:19:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260820085941.380401-1-pawlik.dan@gmail.com> <20260820085941.380401-2-pawlik.dan@gmail.com>
In-Reply-To: <20260820085941.380401-2-pawlik.dan@gmail.com>
From: Daniel Pawlik <pawlik.dan@gmail.com>
Date: Wed, 30 Sep 2026 18:19:31 +0200
X-Gm-Features: AclHuK9VCY3Sjvtv8H3qKyzm85-MwnmIxc92I19Mmm-MRvCk9MqeBH9bmWUgmek
Message-ID: <CALC2AphzQ=dHOk2Yjtaw=i2euCLxo+Lk0kO50ixtYydO0yzBHA@mail.gmail.com>
Subject: Re: [PATCH v10 2/2] net: airoha: npu: use cacheline-sized buffers for
 mailbox DMA
To: netdev@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	kuba@kernel.org, lorenzo@kernel.org, nbd@nbd.name, sean.wang@mediatek.com, 
	Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com, 
	pabeni@redhat.com, andrew+netdev@lunn.ch, yangshiji66@outlook.com, 
	upstream@airoha.com, szymon.datko@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_091947_160436_7A4F4496 
X-CRM114-Status: GOOD (  26.73  )
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

Hi Kuba, Lorenzo, Airoha team,

I found a concrete lead for the unresolved cacheline patch in the vendor
firmware. The installed en7581_MT7996_npu_rv32.bin matches the blob in
linux-firmware commit 1043c0303910 by SHA-256.

At file offset 0x3a9c, the Wi-Fi mailbox handler converts the supplied
buffer address before reading the command:

  lui   a5,0x40000
  addi  a4,a5,-1
  and   a4,a4,a0
  or    a4,a4,a5
  lw    a1,0(a4)

This implements (address & 0x3fffffff) | 0x40000000. Both 0xbf6cf000
and 0xff6cf000 produce 0x7f6cf000. W1700K has 2 GiB of RAM starting
at 0x80000000; its current SWIOTLB pool starts at 0xff6cf000.

The handler also returns 1 (success) for an unsupported operation type
at file offset 0x3b4a. My earlier claim that mailbox success proved a
correct command read was therefore unjustified. The traces do not
establish a read-succeeds/write-fails limitation.

This suggests an address-window problem, but the NPU-side bus mapping
still needs confirmation. The cacheline patch avoids the observed bounce
path without constraining the address of future direct allocations.

Can Airoha confirm which host DRAM range this alias covers, and whether
mailbox buffers above 0xbfffffff are supported?

I have prepared, but not yet run, a test retaining all 2 GiB of RAM and
the 12-byte DMA_BIDIRECTIONAL mapping, with the SWIOTLB boot pool below
0xc0000000. A successful version response through a verified bounced
mapping there would help distinguish the address limitation from a
SWIOTLB copy/cache issue.

Thanks,
Dan

czw., 20 sie 2026 o 11:00 Daniel Pawlik <pawlik.dan@gmail.com> napisa=C5=82=
(a):
>
> On non-coherent ARM64 (EN7581), the kernel's dma_direct_map_page()
> forces swiotlb bounce buffering when:
>
>   !IS_ALIGNED(phys | size, dma_get_cache_alignment())
>
> The NPU mailbox buffers are 12-24 bytes, well below the 64-byte cache
> line size, so this check always fails regardless of physical address
> alignment. The swiotlb sync path itself works correctly, but the
> EN7581 NPU cannot DMA-write to the swiotlb bounce buffer address
> range =E2=80=94 it reads commands fine (mbox_status=3D0x7 success) but ne=
ver
> writes responses back, leaving response fields as zeros.
>
> This was confirmed through five boot traces on a Gemtek W1700K:
>
>   - Boots 1-4: all streaming DMA through swiotlb (is_swiotlb=3D1),
>     bounce buffer byte-identical to pre-map after NPU completion,
>     even after explicit CPU cache invalidation (dcache_inval_poc).
>     NPU version reads 0.0.
>
>   - Boot 5: kmalloc'd cache-line-aligned buffer bypasses swiotlb
>     (is_swiotlb=3D0 on all 169 mappings), NPU writes response data
>     directly, version reads 0.1111, WiFi fully functional.
>
> Fix by rounding mailbox buffer allocations up to
> dma_get_cache_alignment() and mapping the rounded length. The original
> payload size is still programmed into the mailbox length register.
> kmalloc returns cache-line-aligned pointers on ARM64 for allocations
> >=3D ARCH_KMALLOC_MINALIGN, so the IS_ALIGNED check passes and swiotlb
> is not triggered.
>
> Fixes: 6f884eb87a79 ("net: airoha: Fix DMA direction for NPU mailbox buff=
er")
> Link: https://patchwork.kernel.org/project/linux-mediatek/patch/202608141=
10017.2795022-1-pawlik.dan@gmail.com/
> Link: https://patchwork.kernel.org/project/linux-mediatek/patch/202608091=
52813.585797-1-pawlik.dan@gmail.com/
> Link: https://patchwork.kernel.org/project/linux-mediatek/patch/202608050=
70851.2885888-1-pawlik.dan@gmail.com/
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Daniel Pawlik <pawlik.dan@gmail.com>
> ---
>  drivers/net/ethernet/airoha/airoha_npu.c | 25 +++++++++++++++---------
>  1 file changed, 16 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ether=
net/airoha/airoha_npu.c
> index 4045d1eb93ea..3416f921f961 100644
> --- a/drivers/net/ethernet/airoha/airoha_npu.c
> +++ b/drivers/net/ethernet/airoha/airoha_npu.c
> @@ -5,6 +5,7 @@
>   */
>
>  #include <linux/devcoredump.h>
> +#include <linux/dma-mapping.h>
>  #include <linux/firmware.h>
>  #include <linux/platform_device.h>
>  #include <linux/of_net.h>
> @@ -160,15 +161,21 @@ struct wlan_mbox_data {
>         DECLARE_FLEX_ARRAY(u8, d);
>  };
>
> +static size_t airoha_npu_mbox_size(size_t len)
> +{
> +       return ALIGN(len, dma_get_cache_alignment());
> +}
> +
>  static int airoha_npu_send_msg(struct airoha_npu *npu, int func_id,
>                                void *p, int size)
>  {
>         u16 core =3D 0; /* FIXME */
>         u32 val, offset =3D core << 4;
>         dma_addr_t dma_addr;
> +       size_t map_len =3D airoha_npu_mbox_size(size);
>         int ret;
>
> -       dma_addr =3D dma_map_single(npu->dev, p, size, DMA_BIDIRECTIONAL)=
;
> +       dma_addr =3D dma_map_single(npu->dev, p, map_len, DMA_BIDIRECTION=
AL);
>         ret =3D dma_mapping_error(npu->dev, dma_addr);
>         if (ret)
>                 return ret;
> @@ -191,7 +198,7 @@ static int airoha_npu_send_msg(struct airoha_npu *npu=
, int func_id,
>
>         spin_unlock_bh(&npu->cores[core].lock);
>
> -       dma_unmap_single(npu->dev, dma_addr, size, DMA_BIDIRECTIONAL);
> +       dma_unmap_single(npu->dev, dma_addr, map_len, DMA_BIDIRECTIONAL);
>
>         return ret;
>  }
> @@ -333,7 +340,7 @@ static int airoha_npu_ppe_init(struct airoha_npu *npu=
)
>         struct ppe_mbox_data *ppe_data;
>         int err;
>
> -       ppe_data =3D kzalloc_obj(*ppe_data);
> +       ppe_data =3D kzalloc(airoha_npu_mbox_size(sizeof(*ppe_data)), GFP=
_KERNEL);
>         if (!ppe_data)
>                 return -ENOMEM;
>
> @@ -354,7 +361,7 @@ static int airoha_npu_ppe_deinit(struct airoha_npu *n=
pu)
>         struct ppe_mbox_data *ppe_data;
>         int err;
>
> -       ppe_data =3D kzalloc_obj(*ppe_data);
> +       ppe_data =3D kzalloc(airoha_npu_mbox_size(sizeof(*ppe_data)), GFP=
_KERNEL);
>         if (!ppe_data)
>                 return -ENOMEM;
>
> @@ -375,7 +382,7 @@ static int airoha_npu_ppe_flush_sram_entries(struct a=
iroha_npu *npu,
>         struct ppe_mbox_data *ppe_data;
>         int err;
>
> -       ppe_data =3D kzalloc_obj(*ppe_data);
> +       ppe_data =3D kzalloc(airoha_npu_mbox_size(sizeof(*ppe_data)), GFP=
_KERNEL);
>         if (!ppe_data)
>                 return -ENOMEM;
>
> @@ -399,7 +406,7 @@ static int airoha_npu_foe_commit_entry(struct airoha_=
npu *npu,
>         struct ppe_mbox_data *ppe_data;
>         int err;
>
> -       ppe_data =3D kzalloc_obj(*ppe_data, GFP_ATOMIC);
> +       ppe_data =3D kzalloc(airoha_npu_mbox_size(sizeof(*ppe_data)), GFP=
_ATOMIC);
>         if (!ppe_data)
>                 return -ENOMEM;
>
> @@ -434,7 +441,7 @@ static int airoha_npu_ppe_stats_setup(struct airoha_n=
pu *npu,
>         int err, size =3D num_stats_entries * sizeof(*npu->stats);
>         struct ppe_mbox_data *ppe_data;
>
> -       ppe_data =3D kzalloc_obj(*ppe_data, GFP_ATOMIC);
> +       ppe_data =3D kzalloc(airoha_npu_mbox_size(sizeof(*ppe_data)), GFP=
_ATOMIC);
>         if (!ppe_data)
>                 return -ENOMEM;
>
> @@ -466,7 +473,7 @@ static int airoha_npu_wlan_msg_send(struct airoha_npu=
 *npu, int ifindex,
>         int err, len;
>
>         len =3D sizeof(*wlan_data) + data_len;
> -       wlan_data =3D kzalloc(len, gfp);
> +       wlan_data =3D kzalloc(airoha_npu_mbox_size(len), gfp);
>         if (!wlan_data)
>                 return -ENOMEM;
>
> @@ -489,7 +496,7 @@ static int airoha_npu_wlan_msg_get(struct airoha_npu =
*npu, int ifindex,
>         int err, len;
>
>         len =3D sizeof(*wlan_data) + data_len;
> -       wlan_data =3D kzalloc(len, gfp);
> +       wlan_data =3D kzalloc(airoha_npu_mbox_size(len), gfp);
>         if (!wlan_data)
>                 return -ENOMEM;
>
> --
> 2.55.0
>


--=20
Z powa=C5=BCaniem,
Daniel Pawlik

