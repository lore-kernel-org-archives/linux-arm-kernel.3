Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EAA9C98311
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 10:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xwpW92JGbEzXtzwYPFYrQF6TWGLrLwKH/MCyMXFaCU8=; b=rUw0ip7JXlf0JOuKmlT42d7xPE
	lY1fkL/Rp6MGoDQCBEqDjfNwM6nbOfwPzI4bTMnr2iGl2g8/W2pEYZw39oQMhPDrF5ZDG/6rD1YyS
	ZiLZ/eei/VDj/yfa0rxSWgqtOIZKVcuRZLwcF6Mm2tYxmQoBmH7VmkoE/QlBkxTSJEjb+BxnGmN/U
	fu4uUrB8JIhVbmaEEFAbM/0dMK/1wK931yMrusTiwEdWjlbVa7L27gfnsBkmhWVC32SIpt5Gkxewv
	QqDgP+Wfv4MgabEGPxJb2EWGgaqexAv1eI3+CxLHEZw1ZXb9PnDShqPWEaxbsiV4FoQEba0lOYK1L
	UzHSDUCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9gbM-0000000AhXz-07sh;
	Thu, 24 Sep 2026 10:22:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9gbI-0000000AhWD-3jcN;
	Thu, 24 Sep 2026 10:22:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=xwpW92JGbEzXtzwYPFYrQF6TWGLrLwKH/MCyMXFaCU8=; b=qv4hPaf7JkF3kCdE22YGEC6Eo/
	1xl6GIDeOU8K17B8EnF+zuAi7DwlSiQq/O4t41hWgkZ4fGcNkpVIuu+vOU7zfSJGofj9aCVtbfjks
	divxH0gRxJYFWytlRSwmUAUQHH584u6YALsUnnIcgfQJxQahfKguf/hnhub+EV/vGkOkmXfIjiWaA
	BAEMqnCr0D4WTz8/+bK4zRB7ewZAypU54o+xmDCbGRVy8CFMXa3o/Jz/ZW8LW0QqNzGh8W7QK5CFj
	MS/HjCmUV1z6Qi0mbSgopnNuvFAoU+oZ1f0eZRlcalmD2ZL1B8rew9IY/lAGF/IxAwmNtazxNQjrC
	gfajdkbA==;
Received: from fhigh-b6-smtp.messagingengine.com ([202.12.124.157])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9gbF-0000000Fpyu-2PgG;
	Thu, 24 Sep 2026 10:22:47 +0000
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id EC7037A0097;
	Thu, 24 Sep 2026 06:22:38 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Thu, 24 Sep 2026 06:22:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1790245358; x=
	1790331758; bh=xwpW92JGbEzXtzwYPFYrQF6TWGLrLwKH/MCyMXFaCU8=; b=i
	KRjkWo0fW5wJBDAJ26EFKPqaupuLhWwlyEAh6yGlvgXhTNrLs3QfPFp9GzADgP7d
	tMeSIkXK1cUuAQ5j6WKWDXiMy3EJmAqoNKh7UfIZnbf1Dx/ywPfS0I1vebiQ7Ykf
	TlBJ8i63t97D3vtHGu4MyE2YybcN3PkkrSnRFZcO/2AeZ0SO5jvxyr/ugVJwfh2N
	/S8V+3pzzcGPPORIDdhv9oOPiMZeJ4Z14LNG3wRRVuavRWCQYumVRweMyG6CcdPt
	dgZnD9rrZfXjUEVy+3GVQ1qtDAVFPb0NlxW+BS9uL9ZB/NiR79fnDGVytzRomWjw
	ApIeDGCiLGRJHF9lIZD9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1790245358; x=1790331758; bh=x
	wpW92JGbEzXtzwYPFYrQF6TWGLrLwKH/MCyMXFaCU8=; b=rKBbM6F77hg3Jixhu
	7s6xll6/mF+CoYskvl+D7MHPAY16IEZ/oIxEPvn9cihzfbNhucmMprG3S/aIDXU3
	4T8dL1gNiCWpdzqOAEkZMXx9OhPyzlNrAbHTs0qX2yAyfqTYXnU06IiGD+IqPkOc
	N5AqkU1s7tW48rfPfFJQUhY29Kz+f8Qshr943lX19xzo44JiiPX15xnxuKI/aGS7
	OqWfq0D54ajx9o+fbY98z2IYZq6A4itBV5rIYafvhSfB79tXdyFHUn5yGnfFwNCi
	tqSc60VYH35gbk5hbpAon2cGUFaRebZ6rKRiO1+xFVmdgoyoYsC4BVqTkuBQa7Ap
	a4NQg==
X-ME-Sender: <xms:7vm0ajqypYjs1_SHtrwYMYMg6C3qW8-wbm7xvsxkMoQjB3Fe_kdjXA>
    <xme:7vm0atzeLBQPhr3LnnXkOBmkxcbsBO9dOYtpRJTdK30esdiYcnle463RspiukqnmC
    FhHfq28uhQGYUA1tzPUrlc_7p_uMf-jQ4fRLMB947w_aMETGV0KjlPa>
X-ME-Received: <xmr:7vm0auDp-hwRDeHOFFHu5D1bKtEDh-P2frTWb4lSfmmWmGTEifNfM2egXmxggzbxiYPikdR2SQ>
X-ME-Proxy-Cause: dmFkZTFPKKwhcsF2tVcf6J1tdoJzHIGivu3GiCcgJWp0Pt/Z9Gazphq9uGNO64qgWXMd+/
    r0Y/QC+GxAQC2Q0ieU8CUeap8kK2TKuEf79EXK3nmOyezz75bao1uY7ZOtIqBBuPshRXdM
    IOJk66Q73oMH4TFALUk5Kcv9/tV+8zmUjNu4znwNLW6QCtNjM5T8lbyMLgXah+SwAfjMDC
    rCr4sv174gNvDyZRPPY9GCenUHIgd5s2D05F8pDWC2YXojrrAeUc6Y5eDqXskNa/85NpzE
    OHpcem/V6xXRehfddSOwZh22araaf502XMhjJIeZwed46ATd8n5B6uoJ2HCgVahU0f6Ubx
    whOd0LNLSHUROlH4FTlLbnthylfxgk4+mepJQxd//EfYV7H0rGj84bHGsG3HqTfH26PlDV
    p9WVw8dzguo/vs0BUEY4seVr3h+rhzz4IDrGMOhC6/1H0RGIduPbKa/H7DChraU+mcz/+a
    RRUGFPwgcmu3/KgXtsSvkPwHyqj/+GFAFbb7QUq/ZfPnw7HRClQCc9nXnwD+Z2lGc1x0EI
    z8/Rbeyusuzyo8J6+7Ng9j+3UxsFx1ncudZdx3y/jheQ4PVwT9kR2XqGmKBcYJ8sUJn1Uw
    8aQZXpbU77T4y6kJaeAGWhhyGYHEd7oCCD3edeTFmhtdpnRy7t4C9uCDXhWw
X-ME-Proxy: <xmx:7vm0arITajPw14F_qSRjMzotAm8wIDrgGeCLgd65ZxLhvd22a_GiiA>
    <xmx:7vm0ahH9DRBYT5HGfcWQZ038BTIk9lmQ5G58aQi0oZm8iM86dRhTJw>
    <xmx:7vm0auH5gyDgI7SQYKOC3Q92qcj6ihtVCvs6Baiz9p2TV8gTxkQghw>
    <xmx:7vm0ahuxj8f5z8DcRftU3KU_pJqCB60hwldsjG0wEh3WSQsDML_jnw>
    <xmx:7vm0aqyXPJ0VgDOq7V3faO8HVaVyvhj1TLPlP2JwwVKDMP0xeXZgPf9j>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 24 Sep 2026 06:22:29 -0400 (EDT)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: tomeu@tomeuvizoso.net,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	ulfh@kernel.org,
	p.zabel@pengutronix.de,
	ogabbay@kernel.org,
	zhangqing@rock-chips.com
Cc: royalnet026@gmail.com,
	abel.vesa@oss.qualcomm.com,
	sebastian.reichel@collabora.com,
	sidong.yang@furiosa.ai,
	u.kleine-koenig@baylibre.com,
	chaoyi.chen@rock-chips.com,
	diederik@cknow-tech.com,
	alchark@flipper.net,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiaxing Hu <gahing@gahingwoo.com>
Subject: [PATCH v14 04/15] accel/rocket: let the core suspend after a reset
Date: Thu, 24 Sep 2026 22:21:24 +1200
Message-ID: <20260924102135.92217-5-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924102135.92217-1-gahing@gahingwoo.com>
References: <20260924102135.92217-1-gahing@gahingwoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_112245_820653_284A1B47 
X-CRM114-Status: GOOD (  11.11  )
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

rocket_reset() drops the in-flight job's runtime PM reference with
pm_runtime_put_noidle(), which requests nothing, so the core does not
suspend until something else asks and its power domain does not cycle. On
RK3576 the domain's power-on resets the NPU bus interface; without it the
IOMMU stops answering and the job after a timeout fails.

Use pm_runtime_put_autosuspend(), as the completion path does. On a ROCK 4D
the job after a timeout goes from 0 to 128 of 128 channels correct.

Link: https://lore.kernel.org/all/20260819073530.6087-1-royalnet026@gmail.com/
Fixes: 0810d5ad88a1 ("accel/rocket: Add job submission IOCTL")
Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
Tested-by: Igor Paunovic <royalnet026@gmail.com> # RK3588, three cores, induced reset, JOB_TIMEOUT_MS=2
---
 drivers/accel/rocket/rocket_job.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/rocket_job.c
index bcafa89ba..996890025 100644
--- a/drivers/accel/rocket/rocket_job.c
+++ b/drivers/accel/rocket/rocket_job.c
@@ -443,12 +443,12 @@ rocket_reset(struct rocket_core *core, struct drm_sched_job *bad)
 
 	/*
 	 * No handler is running now, but we might still have stuck jobs. Let's
-	 * make sure the PM counters stay balanced by manually calling
-	 * pm_runtime_put_noidle().
+	 * make sure the PM counters stay balanced by putting the reference the
+	 * job took, and request idle while doing it so the core can suspend.
 	 */
 	scoped_guard(mutex, &core->job_lock) {
 		if (core->in_flight_job)
-			pm_runtime_put_noidle(core->dev);
+			pm_runtime_put_autosuspend(core->dev);
 
 		iommu_detach_group(NULL, core->iommu_group);
 
-- 
2.43.0


