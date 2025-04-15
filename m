Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F361CC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 13:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hmONAn3SIj0+eTeDSTr6tL6bjlYp6NFOl1GgEvAvNIU=; b=tKgVrUcsWIxrilE8VlqZFr/xTX
	EG1rOHMFK7NRpv4FojiYYSU9+vmNCkFsEjUTnXgZdNVb6bUM3A+DkQM+ckyVKi3KbXdumOgjTEU6i
	uXL1xHZQwP6DjMoZrWjYQIiatG1cH9ZL0FqGxXuYYBq2yksLTgjQSFrYqykA/PJNuSKwShTs8GPcL
	+QD8J9UztjsmWTvb6/fXhh9lJULgIXBZAJs9lI3hO3IczUb9cHMDj5i8K+yS8tRXQzxCSgX924/lx
	vSvpK3+iHl/ZhsA25rUaEYxxmfR0xcZQnp+eSGpI3nW5Yd26kEK18keD9Ua1fG41mDv3NBbs2AsV0
	ILv/SmAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4gZC-00000005xYJ-42dN;
	Tue, 15 Apr 2025 13:43:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4gRP-00000005w0h-367x;
	Tue, 15 Apr 2025 13:35:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4854968449;
	Tue, 15 Apr 2025 13:34:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE84BC4CEDD;
	Tue, 15 Apr 2025 13:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744724106;
	bh=pprMqPez/8Jyc3i4Z+10XDj1QJQemlqTj9hsKCg5+Rg=;
	h=From:Date:Subject:To:Cc:From;
	b=YVc68VCCp+TyKnlauoCVe1PpRTMQESUBG8TZpx7VSv8mXVUmBEcO0qYZ0m8oheo8S
	 Jn3tkwEKRFhh8VYk1HM/h99RFLQW35qD4tsC88h4fl49QNhevp+ymRb4Jgc+81DTv4
	 8H45pjfHG5Is55MHAhXFsj00GZCJqGflvzo2LUtaPaLK4jbl9nDAlGsh8LPKiZBu3g
	 E8hus4bBa7w73VjslqgGZ9dywsU0GFU7yrOCxIEURw3+Nej91tKOOr1S0mSeekB2ie
	 6ON6vxH5MjdFQbzCOhbZZDeGOeZ3D6PqiuLGhRw2J2rVjz+xxxFY9hQTUp27XW4xv3
	 P/IL88RWQGmYw==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 15 Apr 2025 14:31:51 +0100
Subject: [PATCH] staging: bcm2835-audio: Validate values written to
 controls
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-staging-bcm2835-alsa-limit-v1-1-4ed816e9c0fc@kernel.org>
X-B4-Tracking: v=1; b=H4sIAMZf/mcC/x3MQQqEMAwAwK9Izgba2oK7XxEPUWM3oF1pRATx7
 xaPc5kLlLOwwre6IPMhKv9UYOsKxh+lyChTMTjjgvHWo+4UJUUcxtW1TUBalHCRVXYM3k2W27k
 x9IESbJlnOd+86+/7AVfk2x9sAAAA
X-Change-ID: 20250414-staging-bcm2835-alsa-limit-542d1e8f30a9
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1678; i=broonie@kernel.org;
 h=from:subject:message-id; bh=pprMqPez/8Jyc3i4Z+10XDj1QJQemlqTj9hsKCg5+Rg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBn/mCHheEaIqvepD8vxtfR73p/5HvsDsou0ZDAJWO6
 8aqBGvGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ/5ghwAKCRAk1otyXVSH0CzsB/
 4ntr+ThqGT8N9GDKVtVmPH1MwfPfQMDniJEv+cyVMx1SuRo5mG2CIF0LL8Pq+y6QmIi5W7RU5XZfDQ
 Td/0SXcm5P4krn6P4PP8LgfgAb2qU4VrVHO2gSR+BuUAiqieuddKnPtom9DbKxdk+ZCFU1csZl29br
 MeCCcGv6beW2YD34b9pWHZoiKsTHi46GgWqu+CjPg5D6YkrsfWoZvBij5tiCFn1VRIBhu3SqlkFmiL
 LfZ8uFcU0kSzV/SD5IZ6JfL6PXp1HeMP41S3V0ogDR7RpY8RSJNtmLoRS+eba4AIZ5tLzDoo+QvPl6
 dFdMd3BepbcO/xDPIApMQIzAbZKCqQ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

The bcm2835-audio driver makes no effort to validate the values it accepts
from userspace, causing it to accept invalid values:

# # PCM Playback Switch.0 Invalid boolean value 2
# not ok 5 write_invalid.Headphones.1
# # PCM Playback Volume.0 value -10240 less than minimum -10239
# # PCM Playback Volume.0 value 401 more than maximum 400
# not ok 12 write_invalid.Headphones.0

Add validation.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/staging/vc04_services/bcm2835-audio/bcm2835-ctl.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/staging/vc04_services/bcm2835-audio/bcm2835-ctl.c b/drivers/staging/vc04_services/bcm2835-audio/bcm2835-ctl.c
index 1c1f040122d7..7d0ddd5c8cce 100644
--- a/drivers/staging/vc04_services/bcm2835-audio/bcm2835-ctl.c
+++ b/drivers/staging/vc04_services/bcm2835-audio/bcm2835-ctl.c
@@ -71,6 +71,7 @@ static int snd_bcm2835_ctl_put(struct snd_kcontrol *kcontrol,
 			       struct snd_ctl_elem_value *ucontrol)
 {
 	struct bcm2835_chip *chip = snd_kcontrol_chip(kcontrol);
+	struct snd_ctl_elem_info info;
 	int val, *valp;
 	int changed = 0;
 
@@ -84,6 +85,11 @@ static int snd_bcm2835_ctl_put(struct snd_kcontrol *kcontrol,
 		return -EINVAL;
 
 	val = ucontrol->value.integer.value[0];
+
+	snd_bcm2835_ctl_info(kcontrol, &info);
+	if (val < info.value.integer.min || val > info.value.integer.max)
+		return -EINVAL;
+
 	mutex_lock(&chip->audio_mutex);
 	if (val != *valp) {
 		*valp = val;

---
base-commit: 8ffd015db85fea3e15a77027fda6c02ced4d2444
change-id: 20250414-staging-bcm2835-alsa-limit-542d1e8f30a9

Best regards,
-- 
Mark Brown <broonie@kernel.org>


