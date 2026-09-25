Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9FEEC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 15:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LvgREEEhLtnlSAa2TqV+iSmo5cysotPSfNcR8BHubB4=; b=CEOTPfEyxnnqFvESGFMOAyZxAp
	0xY2DzDulW33detcuEcQpSJuAy4cMOt2FwCsMvw4gs2e1mo4jRXr3VfvMLe4c1k10TJBakdk5Soj5
	JZksI/zZcM1bAxs7rkJ4ckUljKpRiMfm2m4b92NtX2GkVttqovipZi7eE3pVpsui8Nls5cVge+bYI
	o1m7XeZYucMSQfeLsGDjzjq1X65uWRIlGSbFgMoWVriOFGRy5mH5lpARmB8tInW5x4zSqwhNq/ztU
	SoS0iB/eEAPyFUnfk+XcfGyBc2XOAtc6ib12FCvD2zGvy+kvHDJ7hLaoBYfFMsgSLVNtYI3aNKMrD
	oD1zCIDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7wu-0000000DoL6-1p86;
	Fri, 25 Sep 2026 15:34:56 +0000
Received: from mail-lf2-x10.google.com ([2a00:1450:4864:36::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7wr-0000000DoJs-2oMH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 15:34:54 +0000
Received: by mail-lf2-x10.google.com with SMTP id 2adb3069b0e04-5b5e4f1b846so1196675e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 08:34:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790350490; cv=none;
        d=google.com; s=arc-20260327;
        b=csb4XOXGDtnpXMbnRuL6Wq9rD1ezfriZcjlW8ar6dfsoQmZ773D3Ng+ERssnmzFXR8
         ehG49bnHkkNx3RNINc7p49AqO/Y7ACCOvigJNeGO/GqDpMD6rfEIxeyzdN6MnutWpzTC
         VBjhrhJibOSRVvS5urg9/E8shgyDi6E2o3MRySCe0Pfv+NNxcT9hogyGaFERHQKNQdhl
         jWYOErRUXCSGJb6sBL0YBuZZVCLUVcEWhA1Hh19duSDVXTNrD6q14W/ERZrtd7EQ5QYV
         9oJg5iqML/G7SOUWkrWI7FH1sc6JQ1dr88arAQmGeIOVlxtoFCfzY57Bmfj3AjwBiGtw
         rGfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LvgREEEhLtnlSAa2TqV+iSmo5cysotPSfNcR8BHubB4=;
        fh=W4g7ofC+o0IMiLUkK/f1KG9oyW5MMv/EfdGwFKJv1h4=;
        b=YHMGmWM8mRNMgn9UnIq+X4P5MjudcZYrAFtS1UalFNjIzMMsJpg+ksAiQrMqQ30VV6
         sOSyc6mq1zR796R1AQvxEDuUAe/u7+9I2kkKyzmrXgeZ4SCzTYINLrsT7RF9P6RaP8gv
         OWK8ThOultBIqCu7qS4i/uwHhwV0WfoWb2Yb7qfAclUlKsGldFEOzYMvC/uZud9Va1EZ
         H0gqL/r/m1Ff/RbVFRw95emkzjTdBaooS8+e2wohpL11QNBjtWWlRJhcCtFkiVCb/xdC
         T4lNuJpUZ5SN/mW5Uh3o14nHIpSupRZ0BGA+ArB2TgU4gUbJnutZBTi41pM2NU+d9N/1
         9/UQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790350490; x=1790955290; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LvgREEEhLtnlSAa2TqV+iSmo5cysotPSfNcR8BHubB4=;
        b=aiuh/orqEpLgO+CFEj4zw5afMqBgJfy63ULfwJ0usCPDk5Qr9tuTJyCJAUcB/HOIC7
         fKTV0hHYWXbjzjSiWB8iFoA30OMDl18uKu0mrwrS/yBAeVXnHsXKQbA82FDLjSH0zoDx
         /KHlY9F1+DTpnHxPqLicdMpFqfjmplD/bccdVkT+9sbUeQYIDw1pRVjTddS5DBR5alM+
         UshHt/gggU2aFrvMzRCGF3t4myrJGDQQesSoBSHL3Cgh1h+3BgQOrrT3C9xRi+kD3G7h
         d13mC/R3/NGl0Fz2Mb0zlyCU6AkXknLRGTq/pZU1FUc74eQNEHXF5uE+kOj8vVcHIkcJ
         2jvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790350490; x=1790955290;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LvgREEEhLtnlSAa2TqV+iSmo5cysotPSfNcR8BHubB4=;
        b=SbC56wyVgOtcmgOdfLkr04jSDPjBItSnQOxcTe8e2CP613lW+s79kuzesY8sgymapA
         mAzOajNVlk/vKCXpRma49TefIwoVAFQjGjsV5zod5bEdK/yownNskYNQGlFM6X2+1pVp
         qCM7YEgAgspemfcoDLz2mUdItoukzCUmcNBtg3D5CQL1alGG+/BAWB9xmTsSJ5s9ur5J
         DQqZqPk0TM/PY6q5Xz4NagE+XyQw6yWmM/GgN8ZWZhAGHItlYjd2oyJcfisecMT/p2kE
         2RuZQ7g7P9wQvCLg5fyt/sOo3Tm7vJljhPew5MI/155jMeHRaethg5RIQQVJB39fm4aP
         Neiw==
X-Forwarded-Encrypted: i=1; AKwUvBzOU434+rZerALgM8J7ZN080/t1yQoubEoaxc9i+o9MZdDwJ43sURhC91zyrcBmbGnq8ceWKVrrD3MDgVqyEhIN@lists.infradead.org
X-Gm-Message-State: AFuF++kQS3yXRBvgduGNT+Mwi8F3CjRvGafnefLk42GpFvdJlhu0TVYj
	GluXmlNeQrTVjOpc0drsg2iaFCrUI3f45Y9JmfxGGNfUkntmYL2qiVZzNLN6elFOYZUB2AkDfVR
	XPae9SxyRoC7m/geImcPriefV8ACYUSR5JD1DU13a
X-Gm-Gg: AYBFou0BbJzny+aWoc0P2klMvSfvK2WsGMLB06Exk0AUSfBbiXUn5G5n0kD8S9njIfZ
	srPLmYRCi14gBsAE3jrVScHxpBc1VARXektGT/A6AlOD02quvqTCVWEROwYpYlj94HoB7+vGQl8
	HFP1yfjDjexD8xHl8FDQfty/AdwC2oB1kL5I/NotVBNKuQ7U8Sg2GdO0ItFq+FiycNogRMbvyKb
	aIDCGwjBNM/TP8Fx91gGN64sisSk3yYk4Y9Uyv0JOYF42driQJI8y88yFmC4+7pUst9Lb8AVCbR
	VAf4Ck+XwwoEI2V9BKHnHIwBEl1+obbdrF1jE2s9/4sIBT7Um27KEg==
X-Received: by 2002:a05:6512:118c:b0:5b7:5142:d495 with SMTP id
 2adb3069b0e04-5b8df085af7mr1904494e87.64.1790350489353; Fri, 25 Sep 2026
 08:34:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260924135201.850038-1-suzuki.poulose@arm.com>
 <20260924135201.850038-6-suzuki.poulose@arm.com> <arZmXFw5Jw2IbAmA@arm.com> <a11aba04-eaaa-43fd-988b-a2581b1b2fdb@arm.com>
In-Reply-To: <a11aba04-eaaa-43fd-988b-a2581b1b2fdb@arm.com>
From: Alper Gun <alpergun@google.com>
Date: Fri, 25 Sep 2026 08:34:37 -0700
X-Gm-Features: AclHuK8ZdVRdb_V4naZFOsXJSH2Fz3e3v_5J12YbiSGiHDcQI7elXhO9Nk5iNy0
Message-ID: <CABpDEu=Dmo6+KpkYwRwYyCWtKjazJvTktVQh6d+2sUM3AchHbg@mail.gmail.com>
Subject: Re: [PATCH v19 5/7] firmware: arm_rmm: Activate the RMM
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	maz@kernel.org, will@kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com, 
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com, 
	joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com, 
	linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com, 
	sdonthineni@nvidia.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com, 
	lpieralisi@kernel.org, enju.kohei@fujitsu.com, sudeep.holla@arm.com, 
	jonathan.cameron@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_083453_739582_E268FB6B 
X-CRM114-Status: GOOD (  18.11  )
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

On Fri, Sep 25, 2026 at 8:02=E2=80=AFAM Suzuki K Poulose <suzuki.poulose@ar=
m.com> wrote:
[...]
> Kdump may be a bit more easier, as the kdump kernel is supposed to use
> the "reserved" region and vmcore access could handle the GPF and
> provide "0"s to the reader ? May be this is one case where the
> host needs to be able to handle GPFs.

I've tested kdump on CCA hardware with a running Realm VM and hit
GPF 0x28 in copy_oldmem_page() when reading pages delegated for
RMM/Realm metadata.
Since do_gpf() already runs fixup_exception(), using
copy_from_kernel_nofault() and falling back to iov_iter_zero() in
copy_oldmem_page() fixes it.

Here is the fix I've tested for the v16 CCA series.


diff --git a/arch/arm64/kernel/crash_dump.c b/arch/arm64/kernel/crash_dump.=
c
index 670e4ce81822..b0ab22293aa9 100644
--- a/arch/arm64/kernel/crash_dump.c
+++ b/arch/arm64/kernel/crash_dump.c
@@ -6,16 +6,28 @@
  * Author: AKASHI Takahiro <takahiro.akashi@linaro.org>
  */

+#include <linux/cpufeature.h>
 #include <linux/crash_dump.h>
 #include <linux/errno.h>
+#include <linux/gfp.h>
 #include <linux/io.h>
+#include <linux/uaccess.h>
 #include <linux/uio.h>
 #include <asm/memory.h>

+static bool system_has_rme(void)
+{
+ u64 pfr0 =3D read_sanitised_ftr_reg(SYS_ID_AA64PFR0_EL1);
+
+ return cpuid_feature_extract_unsigned_field(pfr0,
+    ID_AA64PFR0_EL1_RME_SHIFT);
+}
+
 ssize_t copy_oldmem_page(struct iov_iter *iter, unsigned long pfn,
  size_t csize, unsigned long offset)
 {
  void *vaddr;
+ void *buf;

  if (!csize)
  return 0;
@@ -24,8 +36,31 @@ ssize_t copy_oldmem_page(struct iov_iter *iter,
unsigned long pfn,
  if (!vaddr)
  return -ENOMEM;

- csize =3D copy_to_iter(vaddr + offset, csize, iter);
+ if (!system_has_rme()) {
+ csize =3D copy_to_iter(vaddr + offset, csize, iter);
+ memunmap(vaddr);
+ return csize;
+ }
+
+ buf =3D (void *)__get_free_page(GFP_KERNEL);
+ if (!buf) {
+ memunmap(vaddr);
+ return -ENOMEM;
+ }
+
+ /*
+ * Pages delegated to the Realm Management Monitor (RMM) or Root
+ * world trigger a synchronous Granule Protection Fault (GPF) when
+ * read from the Non-Secure crash kernel. Use copy_from_kernel_nofault()
+ * so the exception table catches the GPF and fall back to zero-filling
+ * the inaccessible granule.
+ */
+ if (copy_from_kernel_nofault(buf, vaddr + offset, csize))
+ csize =3D iov_iter_zero(csize, iter);
+ else
+ csize =3D copy_to_iter(buf, csize, iter);

+ free_page((unsigned long)buf);
  memunmap(vaddr);

  return csize;

