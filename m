Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE59C61DB4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 09:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v+A6CkiHC3XIOqkV2/gVNEf4VMOfqMvctiihGEgdEKM=; b=2xBjKjNHLuGn4RfPjLdJYRNpxM
	VXiVHiJGEWoCDbR8qJO3dYyBmoqEhw9oRBbtck9xOxeqJOFw70oI5ECwPyZaHBCZp4rT6euRZbOBr
	ohXwdC6xRSECKbNXlAAXryFTmAW0wujFmdWkHco+tTI3tTSzCRDQZgx8IAr0wWmqNCvW1bqfwNQ4g
	G5j8FwgiTBA/TmY0aFKYb3SXOgPwVIXqbH0+jm0i5yqsTZdKzpbQQ+sWvITs9JzFFrvN4cBCiiXW+
	lr6GhiMnaDfVPiYINfyPL+Jisf7tbWl6zNA9i804ymdHMjgYrnGTtzYWKW934MB063+kmhVvdNQmJ
	8dA0k5vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wynlf-00000000WiF-3JD6;
	Tue, 25 Aug 2026 09:48:31 +0000
Received: from out-243.mta1.migadu.com ([2001:41d0:203:375::f3] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wynlb-00000000WfO-0RE6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 09:48:30 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=WdTwdsXYegr+pt2vMyfS6s6LbEnxhORlW5D9ksXSlj4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787651304; v=1; x=1788256104;
 b=uMXrgkm6AKakj0jNwOdmTYmeZHA4XrcJKfmA1PrlLUG9OfwWscSrq3txtne8qL838Ngq+FXq
 saNfXKCorRgKes7HGwFNK2Qc7vfB733+Qh7A4TZyHyiN9rHCpakUi0FYnVVHeJnBS096z8WsHQp
 blBvdL9LAKnKq4vA9kZqy7pM=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: from mail-lf1-f52.google.com (209.85.167.52)
	by smtp.migadu.com with ESMTPS id 084ffc18719ad983;
	Tue, 25 Aug 2026 09:48:23 +0000
X-Mizu-Trace-ID: 084ffc18719ad983
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b2a8173142so1342e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 02:48:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqaI8FBeu6X2fZJcsE8oPYIeXGcZ7fmeHhoJB0XZ+DZSUDAo/Ct6ua5c2T/CIC37u5LtBgVelRm6T/aCuelwhn2@lists.infradead.org
X-Gm-Message-State: AFuF++k5jnCKVLM+kTn70CkbhWbYh/nLceVGNIq/QxIbcy4HRpslhVMK
	msG+iglmRFcskdGZBgBuYtDP+3JnbqWEpZznSdMPzN0i9cYAiXloSrwn7YRcNZoBCEWFsxkOwJn
	odRfHvUZ6vPg+qD9KyWQvBbzwG+D5awS6Kp6hSw+c
X-Received: by 2002:a05:6512:239c:b0:5b4:9dba:7402 with SMTP id
 2adb3069b0e04-5b49de72ba7mr66953e87.12.1787651297880; Tue, 25 Aug 2026
 02:48:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260824074245.710955-1-fuad.tabba@linux.dev> <20260824074245.710955-4-fuad.tabba@linux.dev>
 <te43gnvb2v2zlt3m5gwn2qvden5x3vp23o2qo27uif3ebdrodg@grrfqge2htia>
In-Reply-To: <te43gnvb2v2zlt3m5gwn2qvden5x3vp23o2qo27uif3ebdrodg@grrfqge2htia>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 25 Aug 2026 10:47:41 +0100
X-Gmail-Original-Message-ID: <CA+EHjTyYkz5=BV7RfJK_uUuuRunsfSNWmNNrkJ8NdsR_i5NB2g@mail.gmail.com>
X-Gm-Features: AcwNN1XTSUsaQHSIZboYJ25QZYIL7wzGNkOJWlm0Rb0fGSGlQWens35qrUjEXIc
Message-ID: <CA+EHjTyYkz5=BV7RfJK_uUuuRunsfSNWmNNrkJ8NdsR_i5NB2g@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] KVM: arm64: vgic: Tear down what vgic_init()
 created when it fails
To: Yao Yuan <yaoyuan@linux.alibaba.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Eric Auger <eauger@redhat.com>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Sascha Bischoff <Sascha.Bischoff@arm.com>, Sebastian Ene <sebastianene@google.com>, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_024827_290305_D5CB80DE 
X-CRM114-Status: GOOD (  17.79  )
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

Hi Yuan,

On Tue, 25 Aug 2026 at 10:18, Yao Yuan <yaoyuan@linux.alibaba.com> wrote:
...
> > diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
> > index 4012df6002ea6..7493fded53acc 100644
> > --- a/arch/arm64/kvm/vgic/vgic-init.c
> > +++ b/arch/arm64/kvm/vgic/vgic-init.c
> > @@ -462,7 +462,7 @@ int vgic_init(struct kvm *kvm)
> >               if (vgic_supports_direct_irqs(kvm)) {
> >                       ret = vgic_v4_init(kvm);
> >                       if (ret)
>
> Hi Tabba,
>
> > -                             return ret;
> > +                             goto out_teardown;
>
> The vigc_v4_init already called vgic_v4_teardown() in error path,
> thus I think just free dist->spis is enough yet ?

vgic_v4_init() unwinds its own state on every error return, so
vgic_v4_teardown() is a no-op there and freeing the SPI array would be
enough. I'll fold the label split in if I respin.

Thanks for the reviews!
/fuad

>
> >               }
> >       } else {
> >               ret = vgic_v5_init(kvm);
> > @@ -475,12 +475,19 @@ int vgic_init(struct kvm *kvm)
> >
> >       ret = kvm_vgic_setup_default_irq_routing(kvm);
> >       if (ret)
> > -             return ret;
> > +             goto out_teardown;
> >
> >       vgic_debug_init(kvm);
> >       dist->initialized = true;
> >
> >       return 0;
> > +
> > +out_teardown:
> > +     vgic_v4_teardown(kvm);
> > +     kfree(dist->spis);
> > +     dist->spis = NULL;
> > +
> > +     return ret;
> >  }
> >
> >  static void kvm_vgic_dist_destroy(struct kvm *kvm)
> > --
> > 2.39.5
> >

